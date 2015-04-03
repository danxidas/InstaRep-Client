//
//  IRNetworkManager.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "IRNetworkManager.h"
#import <RestKit.h>

@implementation IRNetworkManager


// IRNetworkManager *sharedManager = [IRNetworkManager sharedManager];
+(id) sharedManager{
    static IRNetworkManager *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil){
            sharedMyManager = [[self alloc] init];
        }
        
    }
    return sharedMyManager;
}

-(void) postUserToken:(NSString *)token{
    NSString *searchPath = [NSString stringWithFormat:@"/instarep/authenticate/%@", token];
    
    [[[RKObjectManager sharedManager] HTTPClient] getPath:searchPath
                                               parameters:nil
                                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                      NSLog(@"GREAT SUCCESS");
                                                  }
                                                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                      // response code is in operation.response.statusCode
                                                      NSLog(@"FAILURE:");
                                                      NSLog(@"%ld", (long)operation.response.statusCode);
                                                  }];
}


@end
