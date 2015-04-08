//
//  IRNetworkManager.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "IRNetworkManager.h"
#import "UserPreferences.h"
#import "InstagramUser.h"
#import "CountsUser.h"
#import "DataManager.h"
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

-(void) getUserCode:(NSString *)code{
    NSString *authenticatePath = [NSString stringWithFormat:kAuthenticateURL, code];
    
    [[[RKObjectManager sharedManager] HTTPClient] getPath:authenticatePath
                                               parameters:nil
                                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                      NSLog(@"GREAT SUCCESS");
                                                  }
                                                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                      // response code is in operation.response.statusCode
                                                      NSLog(@"FAILURE:");
                                                      NSLog(@"%ld", (long)operation.response.statusCode);
                                                  }];
    
    DataManager *sharedDataManager = [DataManager sharedObject];
    [sharedDataManager getUserInstagram];
}

-(void) getUserPrefs:(UserPreferences*) prefs{
    
    NSString *userPrefsPath = [NSString stringWithFormat:kUserPreferencesURL,
                               [prefs allowFollows], [prefs allowComments], [prefs allowLikes],
                               [prefs targetAudience], (int)[prefs botTime]];
    
    [[[RKObjectManager sharedManager] HTTPClient] getPath:userPrefsPath
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

-(void) getUserInstagram{
    
    NSString *getUserInstragramPath = [NSString stringWithFormat:kUserInfoURL];
    [[[RKObjectManager sharedManager] HTTPClient] getPath:getUserInstragramPath
                                               parameters:nil
                                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                      NSLog(@"%@", [IRNetworkManager JSONData:responseObject]);
                                                      
                                                    NSDictionary* dict = [IRNetworkManager JSONData:responseObject];
                                                    InstagramUser* userInfo = [[InstagramUser alloc] initWithDictionary:dict];
                                                    NSLog(@"%@, %d %d %d", userInfo.userName, userInfo.following, userInfo.followedBy, userInfo.posts);
                                                      
                                                  }
                                                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                      // response code is in operation.response.statusCode
                                                      NSLog(@"FAILURE:");
                                                      NSLog(@"%ld", (long)operation.response.statusCode);
                                                  }];
}


-(void) startBot{
    NSString *startBotPath = [NSString stringWithFormat:kStartBotURL];
    [[[RKObjectManager sharedManager] HTTPClient] getPath:startBotPath
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

-(void) stopBot{
    NSString *stopBotPath = [NSString stringWithFormat:kStopBotURL];
    [[[RKObjectManager sharedManager] HTTPClient] getPath:stopBotPath
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



-(long) getElaspedTime{

    
    return 0.0;
}


+ (id) JSONData: (NSData*)data;
{
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
   
    // str = [str stringByReplacingOccurrencesOfString:@"NaN" withString:@"0.0"];
    
    NSError* error = nil;
    id response = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    if (error)
    {
        // DLog(@"%@", [error description]);
    }
    return response;
}


@end
