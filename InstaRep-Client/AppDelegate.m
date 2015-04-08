//
//  AppDelegate.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-01.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "AppDelegate.h"
#import "InstagramUser.h"
#import <RestKit/RestKit.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self configureRestKit];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    
    // we tell the os that we still have things to do (i.e. keep updating the stats of a user in the background..)
    
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    // update the user
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)configureRestKit
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:kBaseWebServiceURL];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];

    [[RKObjectManager sharedManager] setAcceptHeaderWithMIMEType:RKMIMETypeTextXML];
    
    
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
//    // setup object mapping
//    RKObjectMapping *countsMapping = [RKObjectMapping mappingForClass:[CountsUser class]];
//    [countsMapping addAttributeMappingsFromDictionary:@{ @"media" : @"posts",
//                                                         @"followed_by" : @"followedBy",
//                                                         @"follows" : @"following"}];
    
    
    RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[InstagramUser class]];
    [userMapping addAttributeMappingsFromDictionary:@{@"username" : @"userName",
                                                      @"bio" : @"bio",
                                                      @"profile_picture" : @"profilePicture",
                                                      @"full_name" : @"fullName",
                                                      @"media" : @"posts",
                                                      @"followed_by" : @"followedBy",
                                                      @"follows" : @"following"}];
     
    
//    [userMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"counts"
//                                                                                toKeyPath:@"counts"
//                                                                              withMapping:countsMapping]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:userMapping
                                                 method:RKRequestMethodAny
                                            pathPattern:nil
                                                keyPath:nil
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    
    
    
    
}

@end
