//
//  DataManager.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-03.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "DataManager.h"
#import "IRNetworkManager.h"

static DataManager* gDataMgr = nil;

@implementation DataManager

+ (DataManager*) sharedObject{
    
    static dispatch_once_t onceToken;
    if (!gDataMgr){
        dispatch_once(&onceToken, ^{
            gDataMgr = [[DataManager alloc] init];
        });
    }
    
    return gDataMgr;
}


// creates a singleton object of InstagramUser Account
- (InstagramUser*) instagramUserAccountObject
{
    static dispatch_once_t onceToken;

    if (instagramUser == nil)
    dispatch_once(&onceToken, ^{
        instagramUser = [[InstagramUser alloc] init];
    });
    return instagramUser;
}

-(void) getUserInstagram{
    
    NSString *getUserInstragramPath = [NSString stringWithFormat:kUserInfoURL];
    [[[RKObjectManager sharedManager] HTTPClient] getPath:getUserInstragramPath
                                               parameters:nil
                                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                      NSLog(@"%@", [IRNetworkManager JSONData:responseObject]);
                                                      
                                                      NSDictionary* dict = [IRNetworkManager JSONData:responseObject];
                                                      instagramUser = [[InstagramUser alloc] initWithDictionary:dict];
                                                      NSLog(@"%@, %d %d %d", instagramUser.userName, instagramUser.following, instagramUser.followedBy, instagramUser.posts);
                                                      
                                                  }
                                                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                      // response code is in operation.response.statusCode
                                                      NSLog(@"FAILURE:");
                                                      NSLog(@"%ld", (long)operation.response.statusCode);
                                                  }];
    

    
}


@end
