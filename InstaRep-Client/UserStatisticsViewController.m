//
//  UserStatisticsViewController.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-04.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "UserStatisticsViewController.h"

@implementation UserStatisticsViewController


-(void) viewDidLoad{
    [super viewDidLoad];
    
    navBar.topItem.title = @"vegan_lover27's stats";
    [self positionForBar:navBar];
}


- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}
@end
