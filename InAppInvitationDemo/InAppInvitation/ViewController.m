//
//  ViewController.m
//  InAppInvitation
//
//  Created by Vineet Choudhary on 18/05/16.
//  Copyright © 2016 Vineet Choudhary. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setup sharing content and contact view default setting
    ContactViewSetting *contactViewSetting = [ContactViewSetting contactViewDefaultSetting];
    [contactViewSetting setNavigationBarColor:[UIColor whiteColor]];
    [contactViewSetting setNavigationItemsColor:[UIColor blackColor]];
    
    ShareContent *shareContent = [ShareContent defaultShareContent];
    [shareContent setSubject:@"InAppInvitation - iOS"];
    [shareContent setMessage:@"Invite user in your app from your app. A simple invitation (Message, Email, Facebook and Twitter ) UI library similar to WhatsApp app"];
    [shareContent setUrl:[NSURL URLWithString:@"https://github.com/vineetchoudhary/InAppInvitation"]];
    //You can also set different message/url etc for different services
    [shareContent setMessageTwitter:@"Twitter specific message."];
    [shareContent setUrlTwitter:[NSURL URLWithString:@"https://github.com/vineetchoudhary"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonMessageInvitationTapped:(UIButton *)sender {
    if ([InAppInvitation isMessageServiceAvailable]) {
        [InAppInvitation startMessageInvitationServiceOnViewController:self andCompletionHandler:^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultDone) {
                NSLog(@"Success");
            }
        }];
    }else{
        NSLog(@"Message service not availabe in your devices.");
    }
}

- (IBAction)buttonEmailInvitationTapped:(UIButton *)sender {
    if ([InAppInvitation isEmailServiceAvailable]) {
        [InAppInvitation startEmailInvitationServiceOnViewController:self andCompletionHandler:^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultDone) {
                NSLog(@"Success");
            }
        }];
    }else{
        NSLog(@"Email service not config in your devices.");
    }
}

- (IBAction)buttonFacebookInvitationTapped:(UIButton *)sender {
    if ([InAppInvitation isFacebookServiceAvailable]) {
        [InAppInvitation startFacebookInvitationServiceOnViewController:self andCompletionHandler:^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultDone) {
                NSLog(@"Success");
            }
        }];
    }else{
        NSLog(@"Facebook service not config in your devices.");
    }
}

- (IBAction)buttonTwitterInvitationTapped:(UIButton *)sender {
    if ([InAppInvitation isTwitterServiceAvailable]) {
        [InAppInvitation startTwitterInvitationServiceOnViewController:self andCompletionHandler:^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultDone) {
                NSLog(@"Success");
            }
        }];
    }else{
        NSLog(@"Twitter service not config in your devices.");
    }
}

- (IBAction)buttonWhatsAppInvitationTapped:(UIButton *)sender {
    if ([InAppInvitation isWhatsAppServiceAvailable]) {
        [InAppInvitation startWhatsAppInvitationService];
    }else{
        NSLog(@"WhatsApp app not installed in your device.");
    }
}

- (IBAction)buttonViberInvitationTapped:(UIButton *)sender {
    if ([InAppInvitation isViberServiceAvailable]) {
        [InAppInvitation startViberInvitationService];
    }else{
        NSLog(@"Viber app not installed in your device.");
    }
}

- (IBAction)buttonInAppInvitationTapped:(UIButton *)sender {
    [InAppInvitation showSharingActionSheetOnViewController:self andCompletionHandler:^(SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultDone) {
            NSLog(@"Success");
        }else{
            NSLog(@"Failed");
        }
    }];
}
@end
