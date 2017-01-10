//
//  ShareContent.h
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
typedef enum : NSUInteger{
    EmailRecipientsTypeTo,
    EmailRecipientsTypeCC,
    EmailRecipientsTypeBCC,
}EmailRecipientsType;
@interface ShareContent : NSObject

@property(nonatomic, strong) NSString *subject;
@property(nonatomic, strong) NSString *message;
@property(nonatomic, strong) NSURL *url;
@property(nonatomic, strong) UIImage *image;

//Individual Message
@property(nonatomic, strong) NSString *messageTwitter;
@property(nonatomic, strong) NSString *messageFacebook;
@property(nonatomic, strong) NSString *messageEmail;
@property(nonatomic, strong) NSString *messageSMS;
@property(nonatomic, strong) NSString *messageWhatsApp;
@property(nonatomic, strong) NSString *messageViber;

//Email Recipients Type
@property(nonatomic, assign) EmailRecipientsType emailRecipientsType;

//Individual URL
@property(nonatomic, strong) NSURL *urlTwitter;
@property(nonatomic, strong) NSURL *urlFacebook;
@property(nonatomic, strong) NSURL *urlEmail;
@property(nonatomic, strong) NSURL *urlSMS;

//Individual Image
@property(nonatomic, strong) UIImage *imageTwitter;
@property(nonatomic, strong) UIImage *imageFacebook;
@property(nonatomic, strong) UIImage *imageEmail;
@property(nonatomic, strong) UIImage *imageSMS;


+(ShareContent *)defaultShareContent;

@end
