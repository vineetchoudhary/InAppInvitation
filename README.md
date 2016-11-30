[![Build Status](https://travis-ci.org/vineetchoudhary/InAppInvitation.svg?branch=master)](https://travis-ci.org/vineetchoudhary/InAppInvitation)

# InAppInvitation
A simple invitation UI library similar to WhatsApp app

---

##1. Setup View Setting and Sharing Content

```
// setup contact view default setting
ContactViewSetting *contactViewSetting = [ContactViewSetting contactViewDefaultSetting];
[contactViewSetting setNavigationBarColor:[UIColor whiteColor]];
[contactViewSetting setNavigationItemsColor:[UIColor blackColor]];
    
// setup sharing content
ShareContent *shareContent = [ShareContent defaultShareContent];
[shareContent setSubject:@"InAppInvitation - iOS"];
[shareContent setMessage:@"Invite user in your app from your app. A simple invitation (Message, Email, Facebook and Twitter ) UI library similar to WhatsApp app"];
[shareContent setUrl:[NSURL URLWithString:@"https://github.com/vineetchoudhary/InAppInvitation"]];
    
//You can also set different message/url etc for different services
[shareContent setMessageTwitter:@"Twitter specific message."];
[shareContent setUrlTwitter:[NSURL URLWithString:@"https://github.com/vineetchoudhary"]];
```

##2. Present Pre-build Share Action Sheet
```
- (IBAction)buttonInAppInvitationTapped:(UIButton *)sender {
    [InAppInvitation showSharingActionSheetOnViewController:self andCompletionHandler:^(SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultDone) {
            NSLog(@"Success");
        }else{
            NSLog(@"Failed");
        }
    }];
}
```
   
   
##3. For Custom UI

###3.1 Message Sharing Action

```
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
```

###3.2 Email Sharing Action
```
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
```

###3.3 Facebook Sharing Action
```
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
```

###3.4 Twitter Sharing Action
```
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
```
###3.5 WhatsApp Sharing Action
```
- (IBAction)buttonWhatsAppInvitationTapped:(UIButton *)sender {
    if ([InAppInvitation isWhatsAppServiceAvailable]) {
        [InAppInvitation startWhatsAppInvitationService];
    }else{
        NSLog(@"WhatsApp app not installed in your device.");
    }
}
```
###3.6 Viber Sharing Action
```
- (IBAction)buttonViberInvitationTapped:(UIButton *)sender {
    if ([InAppInvitation isViberServiceAvailable]) {
        [InAppInvitation startViberInvitationService];
    }else{
        NSLog(@"Viber app not installed in your device.");
    }
}
```


##4. Demo
[![](https://img.youtube.com/vi/z3ME6s1NQ0w/0.jpg)](https://www.youtube.com/watch?v=z3ME6s1NQ0w)

##5. Screenshots
![](https://github.com/vineetchoudhary/InAppInvitation/blob/master/Screenshot/1.png)![](https://github.com/vineetchoudhary/InAppInvitation/blob/master/Screenshot/2.png)

![](https://github.com/vineetchoudhary/InAppInvitation/blob/master/Screenshot/3.png)

![](https://github.com/vineetchoudhary/InAppInvitation/blob/master/Screenshot/4.png)![](https://github.com/vineetchoudhary/InAppInvitation/blob/master/Screenshot/5.png)

![](https://github.com/vineetchoudhary/InAppInvitation/blob/master/Screenshot/6.png)
