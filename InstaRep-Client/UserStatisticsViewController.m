//
//  UserStatisticsViewController.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-04.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "UserStatisticsViewController.h"
#import "DataManager.h"
#import "AuthenticateViewController.h"
#import "IRNetworkManager.h"

@implementation UserStatisticsViewController{
    int newFollowers;
    int oldFollowers;
}


-(void) viewDidLoad{
    [super viewDidLoad];
    
    
    dataManager = [DataManager sharedObject];
    networkManager = [IRNetworkManager sharedManager];
    
  
    NSLog(@"%@", instagramUser.userName);
    navBar.topItem.title = [NSString stringWithFormat:@"%@'s stats",[instagramUser userName]];
    [self positionForBar:navBar];
    [self circularImage:profilePicture widthOrHeightOfImageView:profilePicture.frame.size.width];
    [self updateText];
    // start the bot
    [networkManager startBot];
}

-(void) viewDidAppear:(BOOL)animated{
    [dataManager getUserInstagram];
    instagramUser = dataManager.instagramUserAccountObject;
    oldFollowers = 10;
}


- (IBAction)logout:(id)sender {
    NSHTTPCookieStorage* cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray* instagramCookies = [cookies cookiesForURL:[NSURL URLWithString:kBaseURL]];
    for (NSHTTPCookie* cookie in instagramCookies){
        [cookies deleteCookie:cookie];
    }
    
    [self moveToAuthenticationViewController];
}

- (IBAction)refresh:(id)sender {
    [dataManager getUserInstagram];
    instagramUser = dataManager.instagramUserAccountObject;
    newFollowers = instagramUser.followedBy - oldFollowers;
    [self updateText];
}

- (IBAction)stopBot:(id)sender {
    if([stopBtn.currentTitle  isEqual: @"STOP BOT"]){
        [networkManager stopBot];
        [stopBtn setTitle:@"START BOT" forState:UIControlStateNormal];
    }else{
        
        [networkManager startBot];
        [stopBtn setTitle:@"STOP BOT" forState:UIControlStateNormal];
    }
}


-(void) moveToAuthenticationViewController{
    UIStoryboard * storyboards = self.storyboard;
    NSString * storyboardName = [storyboards valueForKey:@"name"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    AuthenticateViewController *viewController = (AuthenticateViewController *)[storyboard instantiateViewControllerWithIdentifier:@"authentication"];
    [self presentViewController:viewController animated:YES completion:nil];
}


-(void) updateText{
    
    long millis = [networkManager getElaspedTime];
    long second = (millis / 1000) % 60;
    long minute = (millis / (1000 * 60)) % 60;
    long hour = (millis / (1000 * 60 * 60)) % 24;
    
    int likes = [networkManager getLikes];
    
    NSString* time = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", hour, minute, second] ;
   // NSLog(@"%ld", time);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        fullNameText.text = [instagramUser fullName];
        bioText.text = [instagramUser bio];
        userFollowersText.text = [NSString stringWithFormat:@"%d", [instagramUser followedBy]];
        userFollowingText.text = [NSString stringWithFormat:@"%d", [instagramUser following]];
        navBar.topItem.title = [NSString stringWithFormat:@"%@'s stats",[instagramUser userName]];
        newFollowersText.text = [NSString stringWithFormat:@"+ %d", newFollowers];
        timeRemainingText.text = [NSString stringWithFormat:@"%@", time];
        newLikesText.text = [NSString stringWithFormat:@"%d", likes];

    });
}


- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}

- (void)circularImage:(UIImageView *)image
widthOrHeightOfImageView:(NSInteger) widthOrHeight
{
    image.layer.borderWidth = 1.0f;
    image.layer.masksToBounds = NO;
    image.clipsToBounds = YES;
    image.layer.cornerRadius =  widthOrHeight/2;
}
@end
