//
//  Defines.h
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-03.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#ifndef InstaRep_Client_Defines_h
#define InstaRep_Client_Defines_h



#define kBaseWebServiceURL      @"http://localhost:8080/instarep/"
#define kAuthenticateURL        @"authenticate/%@"
#define kUserPreferencesURL     @"userprefs/%d/%d/%d/%d/%d"
#define kUserInfoURL            @"instagramuser/%@"



#define kClientID               @"03ec65db268f41e38d55c87a3698391b"
#define kClientSecret           @"ad9f019ec99a4e6a8cfd0983e75c8418"
#define kBaseURL                @"https://instagram.com/"
#define kInstagramAPIBaseURL    @"https://api.instagram.com/"
#define kAuthenticationURL      @"oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token&scope=likes+comments+relationships"
#define kRedirectURI            @"http://localhost:8080/instarep/"
#define kAccessToken            @"access_token="


#endif
