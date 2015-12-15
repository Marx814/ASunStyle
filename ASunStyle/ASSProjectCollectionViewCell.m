//
//  ASSProjectCollectionViewCell.m
//  ASunStyle
//
//  Created by Marx on 15/12/13.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSProjectCollectionViewCell.h"

@implementation ASSProjectCollectionViewCell

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
    
    _projectImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (kScreenWidth-30)/2, 250)];
    [_projectImageView.layer setMasksToBounds:YES];
    [_projectImageView.layer setBorderWidth:0.5];
    [_projectImageView.layer setBorderColor:UIColorFromHex(0xee008d, 1).CGColor];
    [_projectImageView.layer setCornerRadius:20.0];
    
    [self addSubview:_projectImageView];
    
    UIView *infoBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 180, (kScreenWidth-30)/2, 70)];
    [infoBgView setBackgroundColor:UIColorFromHex(0xffffff, 0.4)];
    [_projectImageView addSubview:infoBgView];
    
    _projectNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, (kScreenWidth-30)/2, 30)];
    [_projectNameLabel setBackgroundColor:[UIColor clearColor]];
    [_projectNameLabel setTextColor:UIColorFromHex(0xf00093, 1)];
    [_projectNameLabel setTextAlignment:NSTextAlignmentCenter];
    [_projectNameLabel setFont:[UIFont systemFontOfSize:18]];
    [infoBgView addSubview:_projectNameLabel];
    
    _projectPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, (kScreenWidth-30)/2/2, 20)];
    [_projectPriceLabel setBackgroundColor:[UIColor clearColor]];
    [_projectPriceLabel setTextColor:UIColorFromHex(0x000000, 1)];
    [_projectPriceLabel setTextAlignment:NSTextAlignmentCenter];
    [_projectPriceLabel setFont:[UIFont systemFontOfSize:12]];
    [infoBgView addSubview:_projectPriceLabel];
    

    _projectSaleLabel = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth-30)/2/2, 40, (kScreenWidth-30)/2/2, 20)];
    [_projectSaleLabel setBackgroundColor:[UIColor clearColor]];
    [_projectSaleLabel setTextColor:UIColorFromHex(0x000000, 1)];
    [_projectSaleLabel setTextAlignment:NSTextAlignmentCenter];
    [_projectSaleLabel setFont:[UIFont systemFontOfSize:12]];
    [infoBgView addSubview:_projectSaleLabel];
}

@end
