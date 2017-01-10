//
//  ShareContent.m
//
//  Created by Vineet Choudhary
//  Copyright © Vineet Choudhary. All rights reserved.
//

#import "ShareContent.h"

@implementation ShareContent

+(ShareContent *)defaultShareContent{
    static ShareContent *shareContent = nil;
    if (!shareContent) {
        shareContent = [[ShareContent alloc] init];
    }
    return shareContent;
}

@end
