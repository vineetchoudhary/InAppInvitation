//
//  ContactTableViewCell.m
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//
#import "ContactTableViewCell.h"

@implementation ContactTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+(UINib *)cellNib{
    return [UINib nibWithNibName:NSStringFromClass([ContactTableViewCell class]) bundle:nil];
}

+(NSString *)cellIdentifier{
    return @"ContactCellId";
}

+(CGFloat )cellSize{
    return 44;
}

-(void)configCellWithContact:(APContact *)contact andContactSubDetailsType:(ContactSubDetailsType)contactSubDetailsType andIsSelected:(BOOL)isSelected{
    [imageViewSelection setImage:[UIImage imageNamed:(isSelected)?@"EditControlSelected":@"EditControl"]];
    switch (contactSubDetailsType) {
        case ContactTableViewCellPhoneNumber:{
            [labelContactSubDetails setText:contact.phones.firstObject.number];
            [labelContactSubDetailsType setText:contact.phones.firstObject.localizedLabel];
            [labelName setText:(contact.name.compositeName.length)?contact.name.compositeName:contact.phones.firstObject.number];
        }break;
            
        case ContactTableViewCellEmailId:{
            [labelContactSubDetails setText:contact.emails.firstObject.address];
            [labelContactSubDetailsType setText:contact.emails.firstObject.localizedLabel];
            [labelName setText:(contact.name.compositeName.length)?contact.name.compositeName:contact.emails.firstObject.address];
        }break;
            
        default:
            break;
    }
}

@end
