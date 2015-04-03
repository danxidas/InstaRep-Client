//
//  InstragramUser.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Util.h"

@interface InstagramUser : NSObject{
    BOOL *isUsingLikes;
    BOOL *isUsingFollows;
    BOOL *isUsingComments;
}

@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSString* profilePicture;
@property (nonatomic, strong) NSString* fullName;
@property (nonatomic, strong) NSString* bio;
@property (nonatomic, strong) NSString* accessToken;

@property (nonatomic, assign) int userId;
@property (nonatomic, assign) int followedBy;

- (id) initWithDictionary:(NSDictionary*)dict;
@end
