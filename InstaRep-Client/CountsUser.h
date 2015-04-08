//
//  CountsUser.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-04.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountsUser : NSObject

@property (nonatomic, assign) NSNumber* followedBy;
@property (nonatomic, assign) NSNumber* following;
@property (nonatomic, assign) NSNumber* posts;
@end
