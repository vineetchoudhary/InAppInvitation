//
//  ViewController.h
//  InAppInvitation
//
//  Created by Vineet Choudhary on 18/05/16.
//  Copyright © 2016 Vineet Choudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <InAppInvitationKit/InAppInvitationKit.h>

@interface ViewController : UIViewController

- (IBAction)buttonMessageInvitationTapped:(UIButton *)sender;
- (IBAction)buttonEmailInvitationTapped:(UIButton *)sender;
- (IBAction)buttonFacebookInvitationTapped:(UIButton *)sender;
- (IBAction)buttonTwitterInvitationTapped:(UIButton *)sender;
- (IBAction)buttonWhatsAppInvitationTapped:(UIButton *)sender;
- (IBAction)buttonViberInvitationTapped:(UIButton *)sender;
- (IBAction)buttonInAppInvitationTapped:(UIButton *)sender;

@end

