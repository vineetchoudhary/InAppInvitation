//
//  ContactTableViewCell.h
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APContact.h"

typedef enum : NSUInteger {
    ContactTableViewCellPhoneNumber,
    ContactTableViewCellEmailId
} ContactSubDetailsType;

@interface ContactTableViewCell : UITableViewCell{
    IBOutlet UIImageView *imageViewSelection;
    IBOutlet UILabel *labelName;
    IBOutlet UILabel *labelContactSubDetails;
    IBOutlet UILabel *labelContactSubDetailsType;
}

+(UINib *)cellNib;
+(NSString *)cellIdentifier;
+(CGFloat )cellSize;
-(void)configCellWithContact:(APContact *)contact andContactSubDetailsType:(ContactSubDetailsType)contactSubDetailsType andIsSelected:(BOOL)isSelected;

@end
