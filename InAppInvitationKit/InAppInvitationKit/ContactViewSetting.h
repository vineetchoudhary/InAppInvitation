//
//  ContactViewSetting.h
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ContactViewSetting : NSObject

//related to navigation area
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) UIColor *navigationBarColor;
@property(nonatomic, strong) UIColor *navigationItemsColor;
@property(nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property(nonatomic, assign) BOOL showSelectDeselectAllOption;

//related to bottom bar
@property(nonatomic, strong) UIColor *bottomBarColor;
@property(nonatomic, strong) UIColor *cancelButtonTextColor;
@property(nonatomic, strong) UIColor *cancelButtonBackgroundColor;
@property(nonatomic, strong) UIColor *doneButtonTextColor;
@property(nonatomic, strong) UIColor *doneButtonBackgroundColor;


+(ContactViewSetting *)contactViewDefaultSetting;

@end
