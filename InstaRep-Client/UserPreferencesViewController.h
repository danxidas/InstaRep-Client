//
//  UserPreferencesViewController.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-03.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRNetworkManager.h"
#import "Util.h"

@interface UserPreferencesViewController : UIViewController{
    
    IBOutlet UISwitch *likeSwitch;
    IBOutlet UISwitch *commentSwitch;
    IBOutlet UISwitch *followSwitch;
    
    IBOutlet UISlider *timeSlider;
    IBOutlet UILabel  *timeLabel;
    
    IBOutlet UISwitch *generalSwitch;
    IBOutlet UISwitch *veganSwitch;
    IBOutlet UISwitch *fitnessSwitch;
    
    BOOL useLikes;
    BOOL useComments;
    BOOL useFollows;
    BOOL targetGeneral;
    BOOL targetVegan;
    BOOL targetFitness;
    
    int targetAudience;
}

@end
