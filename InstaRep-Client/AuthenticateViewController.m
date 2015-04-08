//
//  AuthenticateViewController.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-03.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "AuthenticateViewController.h"
#import "IRNetworkManager.h"
#import "UserPreferencesViewController.h"
#import "DataManager.h"
@interface AuthenticateViewController ()

@end

@implementation AuthenticateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [webView sizeToFit];
     webView.scrollView.scrollEnabled = YES;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Show Instagram login screen for authentication
    NSString* urlString = [kInstagramAPIBaseURL stringByAppendingFormat:kAuthenticationURL,kClientID,kRedirectURI];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    if (![Util checkNetworkConnection])
        return;
    
    
    NSLog(@"%@", urlString);
    [webView loadRequest:request];
}


//   Webview delegate
//   Finds the token to send to server.
//

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString* urlString = [[request URL] absoluteString];
    NSURL *url = [request URL];
    NSArray *urlParts = [url pathComponents];
    
    // Loops until a user logs in with Instagram, and parses the token
    if ([urlParts count] == 2)
    {
        NSRange codeParam = [urlString rangeOfString: kCode];
        if (codeParam.location != NSNotFound)
        {
            NSString* code = [urlString substringFromIndex: NSMaxRange(codeParam)];
          
            // If there are more args, don't include them in the token:
            NSRange endRange = [code rangeOfString: @"&"];
            
            if (endRange.location != NSNotFound)
                code = [code substringToIndex: endRange.location];
            
            if ([code length] > 0 )
            {
                // Send the token to the server to make api calls
                IRNetworkManager *sharedManager = [IRNetworkManager sharedManager];
                [sharedManager getUserCode:code];
                
            }
            
            [self moveToUserPreferencesViewController];
        }
        else
        {
            NSLog(@"User denied request");
        }
        return NO;
    }
    return YES;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"Code : %ld \nError : %@",(long)error.code, error.description);
    //Error : Error Domain=WebKitErrorDomain Code=102 "Frame load interrupted"
    if (error.code == 102)
        return;
    if (error.code == -1009 || error.code == -1005)
    {
        //_completion(kNetworkFail,kPleaseCheckYourInternetConnection);
    }
    else
    {
        //_completion(kError,error.description);
    }
    
    [Util showAlertWithTitle:@"Reach"
                     andText:@"Internet connection is not available. Please check your wifi settings."
                 andDelegate:self];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) moveToUserPreferencesViewController{
    
    UIStoryboard * storyboards = self.storyboard;
    NSString * storyboardName = [storyboards valueForKey:@"name"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UserPreferencesViewController *viewController = (UserPreferencesViewController *)[storyboard instantiateViewControllerWithIdentifier:@"UserPeferences"];
    [self presentViewController:viewController animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
