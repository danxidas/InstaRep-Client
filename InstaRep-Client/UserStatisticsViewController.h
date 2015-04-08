//
//  UserStatisticsViewController.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-04.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstagramUser.h"
#import "DataManager.h"
#import "IRNetworkManager.h"

@interface UserStatisticsViewController : UIViewController <UINavigationBarDelegate>{

    IBOutlet UINavigationBar *navBar;

    IBOutlet UIImageView *profilePicture;
    IBOutlet UILabel *fullNameText;
    IBOutlet UILabel *bioText;
    IBOutlet UILabel *userFollowersText;
    IBOutlet UILabel *userFollowingText;
    
    
    IBOutlet UILabel *newFollowersText;
    
    IBOutlet UILabel *newLikesText;
    IBOutlet UILabel *timeRemainingText;
 
    
    InstagramUser * instagramUser;
    DataManager * dataManager;
    IRNetworkManager * networkManager;
}

@end
