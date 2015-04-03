//
//  DataManager.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-03.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "DataManager.h"

static DataManager* gDataMgr = nil;

@implementation DataManager

+ (DataManager*) sharedObject
{
    if (!gDataMgr)
    {
        gDataMgr = [[DataManager alloc] init];
    }
    return gDataMgr;
}


// creates a singleton object of InstagramUser Account
- (InstagramUser*) instagramUserAccountObject
{
    if (instagramUser == nil)
        instagramUser = [[InstagramUser alloc] init];
    return instagramUser;
}


@end
