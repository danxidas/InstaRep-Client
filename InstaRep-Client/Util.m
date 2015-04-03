//
//  Util.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "Util.h"
#include <sys/xattr.h>
#import <SystemConfiguration/SCNetworkReachability.h>
#import <netinet/in.h>
#import <QuartzCore/CoreAnimation.h>



@implementation Util


+(void) showAlertWithTitle: (NSString*) title andText: (NSString*) text andDelegate: (id)del{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:text delegate:del cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
}

+ (id) checkNull:(id)object
{
    return [object isKindOfClass:[NSNull class]] ? @"" : object;
}

+ (BOOL) checkNetworkConnection
{
    if (![self isConnectedToNetwork])
    {
        [self networkFailureMessage];
        return NO;
    }
    return YES;
}

+ (BOOL) isConnectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    // synchronous model
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        NSLog(@"Error. Could not recover network reachability flags\n");
        return 0;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    //return (isReachable && !needsConnection) ? YES : NO;
    //BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
    
    return (isReachable && !needsConnection);
}

+ (void) networkFailureMessage
{
    NSString *alertTitle = NSLocalizedString (@"Reach",@"Reach");
    NSString *msgText = @"Internet connection is not available. Please check your wifi settings.";
    
    [Util showAlertWithTitle:alertTitle andText:msgText andDelegate:self];
}

@end
