//
//  IRNetworkManager.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit.h>
#import "Defines.h"
#import "UserPreferences.h"

@interface IRNetworkManager : NSObject{

}

+(id) sharedManager;
+(id) JSONData: (NSData*)data;

-(void) getUserToken:(NSString*)token;
-(void) getUserPrefs:(UserPreferences*)prefs;
-(void) getUserInstagram;
-(int)  getLikes;
-(long) getElaspedTime;
-(void) stopBot;
-(void) startBot;






@end
