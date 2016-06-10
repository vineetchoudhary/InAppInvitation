//
//  InAppInvitation.m
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//

#import "InAppInvitation.h"

#define ALERT_SHEET_TITLE @""
#define ALERT_SHEET_MESSAGE @""

#define EMAIL_OPTION_TITLE @"Email"
#define MESSAGE_OPTION_TITLE @"Message"
#define FACEBOOK_OPTION_TITLE @"Facebook"
#define TWITTER_OPTION_TITLE @"Twitter"
#define WHATSAPP_OPTION_TITLE @"WhatsApp"
#define VIBER_OPTION_TITLE @"Viber"
#define CANCEL_OPTION_TITLE @"Cancel"

#define WHATSAPP_URI_SCHEMA @"whatsapp://send?text="
#define VIBER_URI_SCHEMA @"viber://forward?text="

NSString * const number_of_invitation_send = @"number_of_invitation_send";
NSString * const invitation_screen_visibility_count = @"invitation_screen_visibility_count";
NSString * const app_open_count_after_invitation_shown = @"app_open_count_after_invitation_shown";

//NSString * const number_of_time_user_open


@implementation InAppInvitation

+(void)showSharingActionSheetOnViewController:(UIViewController *)viewController andCompletionHandler:(void (^)(SLComposeViewControllerResult result))completionHandler{
    UIAlertController *shareOptionAlertSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //if device able to send mail then add mail option
    if ([MFMailComposeViewController canSendMail]){
        [shareOptionAlertSheet addAction:[UIAlertAction actionWithTitle:EMAIL_OPTION_TITLE style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [InAppInvitation startEmailInvitationServiceOnViewController:viewController andCompletionHandler:^(SLComposeViewControllerResult result) {
                completionHandler(result);
            }];
        }]];
    }
    
    //if device able to send text message then add message option
    if ([MFMessageComposeViewController canSendText]) {
        [shareOptionAlertSheet addAction:[UIAlertAction actionWithTitle:MESSAGE_OPTION_TITLE style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [InAppInvitation startMessageInvitationServiceOnViewController:viewController andCompletionHandler:^(SLComposeViewControllerResult result) {
                completionHandler(result);
            }];
        }]];
    }
    
    //facebook share
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        [shareOptionAlertSheet addAction:[UIAlertAction actionWithTitle:FACEBOOK_OPTION_TITLE style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [InAppInvitation startFacebookInvitationServiceOnViewController:viewController andCompletionHandler:^(SLComposeViewControllerResult result) {
                completionHandler(result);
            }];
        }]];
    }
    
    //twitter share
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        [shareOptionAlertSheet addAction:[UIAlertAction actionWithTitle:TWITTER_OPTION_TITLE style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [InAppInvitation startTwitterInvitationServiceOnViewController:viewController andCompletionHandler:^(SLComposeViewControllerResult result) {
                completionHandler(result);
            }];
        }]];
    }
    
    //Whatsapp share
    if ([InAppInvitation isWhatsAppServiceAvailable]) {
        [shareOptionAlertSheet addAction:[UIAlertAction actionWithTitle:WHATSAPP_OPTION_TITLE style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [InAppInvitation startWhatsAppInvitationService];
        }]];
    }
    
    //Viber share
    if ([InAppInvitation isWhatsAppServiceAvailable]) {
        [shareOptionAlertSheet addAction:[UIAlertAction actionWithTitle:VIBER_OPTION_TITLE style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [InAppInvitation startWhatsAppInvitationService];
        }]];
    }
    
    //cancel button
    [shareOptionAlertSheet addAction:[UIAlertAction actionWithTitle:CANCEL_OPTION_TITLE style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [shareOptionAlertSheet dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    //present sheet
    [viewController presentViewController:shareOptionAlertSheet animated:YES completion:nil];
}

#pragma mark - Start Invitation Services

+(void)startEmailInvitationServiceOnViewController:(UIViewController *)viewController andCompletionHandler:(void (^)(SLComposeViewControllerResult))completionHandler{
    ContactViewController *contactViewController = [[ContactViewController alloc] initWithNibName:NSStringFromClass([ContactViewController class]) bundle:nil];
    [contactViewController setContactSubDetailsType:ContactTableViewCellEmailId];
    [contactViewController setCompletionHandler:completionHandler];
    [viewController presentViewController:[[UINavigationController alloc] initWithRootViewController:contactViewController] animated:YES completion:nil];
}

+(void)startMessageInvitationServiceOnViewController:(UIViewController *)viewController andCompletionHandler:(void (^)(SLComposeViewControllerResult))completionHandler{
    ContactViewController *contactViewController = [[ContactViewController alloc] initWithNibName:NSStringFromClass([ContactViewController class]) bundle:nil];
    [contactViewController setContactSubDetailsType:ContactTableViewCellPhoneNumber];
    [contactViewController setCompletionHandler:completionHandler];
    [viewController presentViewController:[[UINavigationController alloc] initWithRootViewController:contactViewController] animated:YES completion:nil];
}

+(void)startTwitterInvitationServiceOnViewController:(UIViewController *)viewController andCompletionHandler:(void (^)(SLComposeViewControllerResult))completionHandler{
    ShareContent *defaultContent = [ShareContent defaultShareContent];
    SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [slComposeViewController setInitialText:(defaultContent.messageTwitter)?defaultContent.messageTwitter:defaultContent.message];
    [slComposeViewController addURL:(defaultContent.urlTwitter)?defaultContent.urlTwitter:defaultContent.url];
    [slComposeViewController addImage:(defaultContent.imageTwitter)?defaultContent.imageTwitter:defaultContent.image];
    [slComposeViewController setCompletionHandler:completionHandler];
    [viewController presentViewController:slComposeViewController animated:YES completion:nil];
}

+(void)startFacebookInvitationServiceOnViewController:(UIViewController *)viewController andCompletionHandler:(void (^)(SLComposeViewControllerResult))completionHandler{
    ShareContent *defaultContent = [ShareContent defaultShareContent];
    SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [slComposeViewController setInitialText:(defaultContent.messageFacebook)?defaultContent.messageFacebook:defaultContent.message];
    [slComposeViewController addURL:(defaultContent.urlFacebook)?defaultContent.urlFacebook:defaultContent.url];
    [slComposeViewController addImage:(defaultContent.imageFacebook)?defaultContent.imageFacebook:defaultContent.image];
    [slComposeViewController setCompletionHandler:completionHandler];
    [viewController presentViewController:slComposeViewController animated:YES completion:nil];
}

+(void)startWhatsAppInvitationService{
    ShareContent *defaultContent = [ShareContent defaultShareContent];
    NSString *whatsAppURI = [NSString stringWithFormat:@"%@%@",WHATSAPP_URI_SCHEMA,(defaultContent.messageWhatsApp)?defaultContent.messageWhatsApp:defaultContent.message];
    whatsAppURI = [whatsAppURI stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:whatsAppURI]];
}

+(void)startViberInvitationService{
    ShareContent *defaultContent = [ShareContent defaultShareContent];
    NSString *viberAppURI = [NSString stringWithFormat:@"%@%@",VIBER_URI_SCHEMA,(defaultContent.messageViber)?defaultContent.messageViber:defaultContent.message];
    viberAppURI = [viberAppURI stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:viberAppURI]];
}

#pragma mark - Check Invitation Service Availability

+(BOOL)isEmailServiceAvailable{
    return [MFMailComposeViewController canSendMail];
}

+(BOOL)isMessageServiceAvailable{
    return [MFMessageComposeViewController canSendText];
}

+(BOOL)isTwitterServiceAvailable{
    return [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
}

+(BOOL)isFacebookServiceAvailable{
    return [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook];
}

+(BOOL)isWhatsAppServiceAvailable{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:WHATSAPP_URI_SCHEMA]];
}

+(BOOL)isViberServiceAvailable{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:VIBER_URI_SCHEMA]];
}

#pragma mark - Random Invitation

+(BOOL)canShowInvitationScreen{
    NSInteger appOpenCount = [[NSUserDefaults standardUserDefaults] integerForKey:app_open_count_after_invitation_shown];
    [[NSUserDefaults standardUserDefaults] setInteger:(appOpenCount+1) forKey:app_open_count_after_invitation_shown];
    
    NSInteger numberOfInvitationSend = [[NSUserDefaults standardUserDefaults] integerForKey:number_of_invitation_send];
    NSInteger invitationScreenVisibilityCount = [[NSUserDefaults standardUserDefaults] integerForKey:invitation_screen_visibility_count];
    if (appOpenCount > ((invitationScreenVisibilityCount * 4) + (numberOfInvitationSend * 2))) {
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:app_open_count_after_invitation_shown];
        [[NSUserDefaults standardUserDefaults] setInteger:(invitationScreenVisibilityCount+1) forKey:invitation_screen_visibility_count];
        return YES;
    }
    return NO;
}

+(void)increaseInvitationScreenVisibilityCount{
    NSInteger invitationScreenVisibilityCount = [[NSUserDefaults standardUserDefaults] integerForKey:invitation_screen_visibility_count];
    [[NSUserDefaults standardUserDefaults] setInteger:(invitationScreenVisibilityCount+1) forKey:invitation_screen_visibility_count];
}

+(void)setNumberOfInvitationSendByUser:(NSInteger)numberOfInvitation{
    [[NSUserDefaults standardUserDefaults] setInteger:numberOfInvitation forKey:number_of_invitation_send];
}


@end
