//
//  LoginViewController.m
//  iOS Alexa
//
//  Created by Chintan Prajapati on 13/05/16.
//  Copyright © 2016 Chintan. All rights reserved.
//

#import "LoginViewController.h"
#import <LoginWithAmazon/LoginWithAmazon.h>
#import "iOS_Alexa-Swift.h"
#import "MBProgressHUD.h"

#define SCOPE_DATA @"{\"alexa:all\":{\"productID\":\"<< Product ID Here >>\",""\"productInstanceAttributes\":{\"deviceSerialNumber\":\"<< Device Serial Number Here >>\"}}}"

@interface LoginViewController () <AIAuthenticationDelegate>
{
    BOOL triedExistingAccessToken;
}

@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@end

@implementation LoginViewController

-(void) viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //[AIMobileLib clearAuthorizationState:nil];
    
    if (!triedExistingAccessToken) {
        [AIMobileLib getAccessTokenForScopes:@[@"alexa:all"] withOverrideParams:nil delegate:self];
        triedExistingAccessToken = true;
    }
}

- (IBAction)loginButtonClicked:(id)sender {
    //[MBProgressHUD showHUDAddedTo:self.view animated:true];
    [AIMobileLib authorizeUserForScopes:@[@"alexa:all"] delegate:self options:@{kAIOptionScopeData:SCOPE_DATA}];
}

- (void)requestDidSucceed:(APIResult *)apiResult {
    
    if (apiResult.api == kAPIAuthorizeUser) {
        [AIMobileLib getAccessTokenForScopes:@[@"alexa:all"] withOverrideParams:nil delegate:self];
    }
    else {
        ISSharedData.sharedInstance.accessToken = apiResult.result;
        [self performSegueWithIdentifier:@"HomeViewController" sender:nil];
        [MBProgressHUD hideAllHUDsForView:self.view animated:true];
        self.loginButton.hidden = false;
    }
}

- (void)requestDidFail:(APIError *)apiResult {
    self.loginButton.hidden = false;
    [MBProgressHUD hideAllHUDsForView:self.view animated:true];
}

@end
