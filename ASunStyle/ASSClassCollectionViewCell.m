//
//  ASSClassCollectionViewCell.m
//  ASunStyle
//
//  Created by Marx on 15/12/13.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSClassCollectionViewCell.h"

@implementation ASSClassCollectionViewCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customView];
    }
    return self;
}


#pragma mark Custom View
- (void)customView
{
    [self setBackgroundColor:[UIColor clearColor]];
    
    _classImageView = [[UIImageView alloc] initWithFrame:CGRectMake(((kScreenWidth-20)/3-40)/2, 5, 40, 40)];
    [_classImageView.layer setMasksToBounds:YES];
    [_classImageView.layer setBorderWidth:0.5];
    [_classImageView.layer setBorderColor:UIColorFromHex(0xee008d, 1).CGColor];
    [_classImageView.layer setCornerRadius:20.0];
    
    [self addSubview:_classImageView];
    
    _classNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, (kScreenWidth-20)/3, 15)];
    [_classNameLabel setBackgroundColor:[UIColor clearColor]];
    [_classNameLabel setTextColor:UIColorFromHex(0x000000, 1)];
    [_classNameLabel setTextAlignment:NSTextAlignmentCenter];
    [_classNameLabel setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:_classNameLabel];
    
}

@end
