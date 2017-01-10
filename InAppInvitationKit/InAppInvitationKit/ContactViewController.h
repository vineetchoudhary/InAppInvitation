//
//  ContactViewController.h
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>

#import "APContact.h"
#import "ShareContent.h"
#import "APAddressBook.h"
#import "ContactViewSetting.h"
#import "ContactTableCell/ContactTableViewCell.h"


@class InAppInvitation;
@interface ContactViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>{
    IBOutlet UITableView *tableViewContact;
    IBOutlet UIButton *buttonCancel;
    IBOutlet UIButton *buttonDone;
    IBOutlet UIView *viewBottomBar;
    IBOutlet UISearchBar *searchBar;
    IBOutlet UIView *viewBottomSperator;
    IBOutlet UIActivityIndicatorView *activityIndicatorView;
}

@property(nonatomic, assign) ContactViewSetting *contactViewSetting;
@property(nonatomic, assign) ContactSubDetailsType contactSubDetailsType;
@property(nonatomic, copy) SLComposeViewControllerCompletionHandler completionHandler;

- (IBAction)buttonCancelTapped:(UIButton *)sender;
- (IBAction)buttonDoneTapped:(UIButton *)sender;

@end
