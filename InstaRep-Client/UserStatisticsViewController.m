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

@implementation UserStatisticsViewController


-(void) viewDidLoad{
    [super viewDidLoad];
    dataManager = [DataManager sharedObject];
    networkManager = [IRNetworkManager sharedManager];
    instagramUser = dataManager.instagramUserAccountObject;
    navBar.topItem.title = [NSString stringWithFormat:@"%@'s stats",[instagramUser userName]];
    [self positionForBar:navBar];
    [self circularImage:profilePicture widthOrHeightOfImageView:profilePicture.frame.size.width];
    [self updateText];
    // start the bot
    [networkManager startBot];
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

    [self updateText];
}

- (IBAction)stopBot:(id)sender {
    [networkManager stopBot];
}


-(void) moveToAuthenticationViewController{
    UIStoryboard * storyboards = self.storyboard;
    NSString * storyboardName = [storyboards valueForKey:@"name"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    AuthenticateViewController *viewController = (AuthenticateViewController *)[storyboard instantiateViewControllerWithIdentifier:@"authentication"];
    [self presentViewController:viewController animated:YES completion:nil];
}

-(void) updateText{
    dispatch_async(dispatch_get_main_queue(), ^{
        fullNameText.text = [instagramUser fullName];
        bioText.text = [instagramUser bio];
        userFollowersText.text = [NSString stringWithFormat:@"%d", [instagramUser followedBy]];
        userFollowingText.text = [NSString stringWithFormat:@"%d", [instagramUser following]];
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
