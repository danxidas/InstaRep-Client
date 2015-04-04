//
//  UserPreferences.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-04.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserPreferences : NSObject

@property BOOL allowLikes;
@property BOOL allowComments;
@property BOOL allowFollows;
@property BOOL targetAudience;

@property int botTime;



@end
