//
//  Util.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Util : NSObject


+(void) showAlertWithTitle: (NSString*) title andText: (NSString*) text andDelegate: (id)del;
+(id) checkNull:(id)object;
+(BOOL) checkNetworkConnection;
@end
