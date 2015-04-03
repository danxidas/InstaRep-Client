//
//  InstragramUser.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-02.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "InstagramUser.h"

@implementation InstagramUser

- (id) initWithDictionary:(NSDictionary*)dict
{
    if (self = [super init])
    {
        self.userName = [Util checkNull:[dict objectForKey:@"username"]];
        self.profilePicture = [Util checkNull:[dict objectForKey:@"profile_picture"]];
        self.fullName = [Util checkNull:[dict objectForKey:@"full_name"]];
        self.bio = [Util checkNull:[dict objectForKey:@"bio"]];
        
        self.userId = [[Util checkNull:[dict objectForKey:@"id"]] intValue];
        
        NSDictionary* countList = [Util checkNull:[dict objectForKey:@"counts"]];
        self.followedBy = [[Util checkNull:[countList objectForKey:@"followed_by"]] intValue];
    }
    return self;
}



@end
