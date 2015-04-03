//
//  ViewController.m
//  InstaRep-Client
//
//  Created by Richard Ison on 2015-04-01.
//  Copyright (c) 2015 Richard Ison. All rights reserved.
//

#import "ViewController.h"
#import "IRNetworkManager.h"
#import "Util.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize usernameTextField, passwordTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}


- (IBAction)loginBtn:(id)sender {
    

//    NSString* username = usernameTextField.text;
//    NSString* password = passwordTextField.text;
//   
//    if (username.length > 0  && password.length > 0) {
//        User *newUser = [User new];
//        [newUser setUsername:username];
//        [newUser setPassword:password];
//        
//        IRNetworkManager *sharedManager = [IRNetworkManager sharedManager];
//        [sharedManager authenticateUserWith:username andPassword:password];
//    } else {
//        [Util showAlertWithTitle:@"Invalid credentials" andText:@"" andDelegate:self];
//       // NSLog(@"null");
//    }
//    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
