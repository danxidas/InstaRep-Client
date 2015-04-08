//
//  UserPreferencesViewController.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-03.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "UserPreferencesViewController.h"
#import "UserStatisticsViewController.h"

@implementation UserPreferencesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // init values
    useLikes = NO;
    useComments = NO;
    useFollows = NO;
    targetGeneral = NO;
    targetVegan = NO;
    targetFitness = NO;
    
    targetAudience = 1;
    
    timeLabel.text = @"0 hours";
    timeSlider.minimumValue = 1;
    timeSlider.maximumValue = 8;
    
    [self initSwitches];
    
    
   }



-(void) initSwitches{
    
    [likeSwitch setOn:NO];
    [commentSwitch setOn:NO];
    [followSwitch setOn:NO];
    
    [generalSwitch setOn:YES];
    [veganSwitch setOn:NO];
    [fitnessSwitch setOn:NO];
}

-(BOOL) checkPreferences{
    
    if ([likeSwitch isOn])
        useLikes = YES;
    if ([commentSwitch isOn])
        useComments = YES;
    if ([followSwitch isOn])
        useFollows = YES;
    
    
    if([generalSwitch isOn] && ![veganSwitch isOn] && ![fitnessSwitch isOn]){
        targetGeneral = YES;
    } else if (![generalSwitch isOn] && [veganSwitch isOn] && ![fitnessSwitch isOn]){
        targetVegan = YES;
    } else if (![generalSwitch isOn] && ![veganSwitch isOn] && [fitnessSwitch isOn]){
        targetFitness = YES;
    } else {
        [Util showAlertWithTitle:@"Audience" andText:@"Please choose one target audience" andDelegate:self];
        return NO;
    }
    
    if (targetGeneral) {
        targetAudience = 1;
    } else if (targetVegan){
        targetAudience = 2;
    } else if (targetFitness){
        targetAudience = 3;
    }

    return YES;

}
- (IBAction)doneBtn:(id)sender {
    if ([self checkPreferences]){
        NSLog(@"useLikes %d, useComments %d, useFollows %d, targetGen %d, targetVeg %d, targetFit %d, botTime %d", useLikes, useComments, useFollows, targetGeneral, targetVegan, targetFitness, (int)timeSlider.value);
        UserPreferences *prefs = [UserPreferences new];
    
        [prefs setAllowLikes:useLikes];
        [prefs setAllowComments:useComments];
        [prefs setAllowFollows:useFollows];
        [prefs setTargetAudience:targetAudience];
        [prefs setBotTime:(int) timeSlider.value];
    
        IRNetworkManager *sharedManager = [IRNetworkManager sharedManager];
        [sharedManager getUserPrefs:prefs];
    
        [self moveToUserUserStatsViewController];
    }
}

- (IBAction)timeValueChange:(id)sender {
    timeLabel.text = [NSString stringWithFormat:@"%d hours", (int)timeSlider.value];
}

-(void) moveToUserUserStatsViewController{
    
    UIStoryboard * storyboards = self.storyboard;
    NSString * storyboardName = [storyboards valueForKey:@"name"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UserStatisticsViewController *viewController = (UserStatisticsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"UserStatistics"];
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
