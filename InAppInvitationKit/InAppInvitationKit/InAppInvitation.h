//
//  InAppInvitation.m
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>

#import "ContactViewController.h"

@interface InAppInvitation : NSObject

+(BOOL)isEmailServiceAvailable;
+(BOOL)isTwitterServiceAvailable;
+(BOOL)isMessageServiceAvailable;
+(BOOL)isFacebookServiceAvailable;
+(BOOL)isWhatsAppServiceAvailable;
+(BOOL)isViberServiceAvailable;

+(BOOL)canShowInvitationScreen;
+(void)increaseInvitationScreenVisibilityCount;
+(void)setNumberOfInvitationSendByUser:(NSInteger)numberOfInvitation;


+(void)startViberInvitationService;
+(void)startWhatsAppInvitationService;
+(void)showSharingActionSheetOnViewController:(UIViewController *)viewController andCompletionHandler:(void(^)(SLComposeViewControllerResult result))completionHandler;
+(void)startEmailInvitationServiceOnViewController:(UIViewController *)viewController andCompletionHandler:(void(^)(SLComposeViewControllerResult result))completionHandler;
+(void)startMessageInvitationServiceOnViewController:(UIViewController *)viewController andCompletionHandler:(void(^)(SLComposeViewControllerResult result))completionHandler;
+(void)startTwitterInvitationServiceOnViewController:(UIViewController *)viewController andCompletionHandler:(void(^)(SLComposeViewControllerResult result))completionHandler;
+(void)startFacebookInvitationServiceOnViewController:(UIViewController *)viewController andCompletionHandler:(void(^)(SLComposeViewControllerResult result))completionHandler;
@end
