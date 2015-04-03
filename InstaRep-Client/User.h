//
//  User.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{

    NSString *username;
    NSString *password;
    
    NSMutableArray *targetAudience;
    
    BOOL *isUsingLikes;
    BOOL *isUsingFollows;
    BOOL *isUsingComments;
}

@property(strong, nonatomic) NSString *username;
@property(strong, nonatomic) NSString *password;
@property(strong, nonatomic) NSMutableArray *targetAudience;
@property BOOL isUsingLikes;
@property BOOL isUsingFollows;
@property BOOL isUsingComments;
@end
