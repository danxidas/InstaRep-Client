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

static NSString * serviceUrl = @"http://localhost:8080/InstaRep/rep/";
static NSString * authenticateUrl = @"authenticate/%@/%@";


@synthesize serviceUrl, authenticateUrl;



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

-(void) authenticateUserWith:(NSString*)user andPassword:(NSString*)pass{
    
    NSString * username = user;
    NSString * password = pass;
    
    NSString *authenticate= [NSString stringWithFormat:@"authenticate/%@/%@", username, password];
   
    NSString *path = [NSString stringWithFormat:@"%@%@", serviceUrl, authenticate];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:path parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"authenticated buddy");
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"sorry buddy");
    }];
    
    

}



@end
