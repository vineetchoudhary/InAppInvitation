//
//  ContactViewSetting.h
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//

#import "ContactViewSetting.h"

@implementation ContactViewSetting

+(ContactViewSetting *)contactViewDefaultSetting{
    static ContactViewSetting *contactViewSetting = nil;
    if (!contactViewSetting) {
        contactViewSetting = [[ContactViewSetting alloc] init];
        [contactViewSetting setTitle:@"Contacts"];
        [contactViewSetting setNavigationBarColor:[UINavigationBar appearance].backgroundColor];
        [contactViewSetting setNavigationItemsColor:[UIBarButtonItem appearance].tintColor];
        [contactViewSetting setStatusBarStyle:[UIApplication sharedApplication].statusBarStyle];
        [contactViewSetting setShowSelectDeselectAllOption:YES];
        [contactViewSetting setBottomBarColor:[UINavigationBar appearance].backgroundColor];
        [contactViewSetting setCancelButtonTextColor:[[UIButton appearance] titleColorForState:UIControlStateNormal]];
        [contactViewSetting setCancelButtonBackgroundColor:[UIButton appearance].backgroundColor];
        [contactViewSetting setDoneButtonTextColor:[[UIButton appearance] titleColorForState:UIControlStateNormal]];
        [contactViewSetting setDoneButtonBackgroundColor:[UIButton appearance].backgroundColor];
    }
    return contactViewSetting;
}

@end
