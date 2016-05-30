[![Build Status](https://travis-ci.org/vineetchoudhary/InAppInvitation.svg?branch=master)](https://travis-ci.org/vineetchoudhary/InAppInvitation)

# InAppInvitation
A simple invitation UI library similar to WhatsApp app

---

### Setup View Setting and Sharing Content

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
    
### Message Sharing Action

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

### Email Sharing Action
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

### Facebook Sharing Action
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

### Twitter Sharing Action
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
## Demo

### http://www.youtube.com/watch?v=z3ME6s1NQ0w
