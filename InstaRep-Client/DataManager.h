//
//  DataManager.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-03.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InstagramUser.h"


@interface DataManager : NSObject{
    InstagramUser *instagramUser;
}

+ (DataManager*) sharedObject;
- (InstagramUser*) instagramUserAccountObject;

- (void) getUserInstagramWithAccessToken:(NSString*)accessToken;

@end
