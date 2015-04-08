//
//  InstragramUser.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Util.h"
#import "CountsUser.h"

@interface InstagramUser : NSObject

@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSString* profilePicture;
@property (nonatomic, strong) NSString* fullName;
@property (nonatomic, strong) NSString* bio;
@property (nonatomic, strong) NSString* accessToken;

@property (nonatomic) CountsUser* counts;
@property (nonatomic, assign) int userId;

@property (nonatomic, assign) int followedBy;
@property (nonatomic, assign) int following;
@property (nonatomic, assign) int posts;

- (id) initWithDictionary:(NSDictionary*)dict;
@end
