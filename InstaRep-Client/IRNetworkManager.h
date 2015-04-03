//
//  IRNetworkManager.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit.h>

@interface IRNetworkManager : NSObject{
    NSString *serviceUrl;
    NSString *authenticateUrl;
}


@property(strong, nonatomic) NSString *serviceUrl;
@property(strong, nonatomic) NSString *authenticateUrl;


+(id) sharedManager;
-(void) authenticateUserWith:(NSString*)user andPassword:(NSString*)pass;






@end
