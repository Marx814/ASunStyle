//
//  HairdresListCell.m
//  ASunStyle
//
//  Created by soldier on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "HairdresListCell.h"

@implementation HairdresListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //头像
        _headImgV = [[UIImageView alloc] init];
        [_headImgV setFrame:CGRectMake(10, 20, 80, 80)];
        _headImgV.layer.borderWidth = 0.5f;
        _headImgV.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
        _headImgV.layer.cornerRadius = 40.0f;
        [_headImgV.layer setMasksToBounds:YES];
        [_headImgV setImage:[UIImage imageNamed:@"personal_head"]];
        [self addSubview:_headImgV];
        
        // 标题Label
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, kScreenWidth-120 , 35)];
        [_nameLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [_nameLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
        [self.contentView addSubview:_nameLabel];
        
        //星星
        _starRateView = [[CWStarRateView alloc] initWithFrame:CGRectMake(120, 55, 100, 15) numberOfStars:5];
        _starRateView.allowIncompleteStar = YES;
        _starRateView.hasAnimation = NO;
        _starRateView.changeStartPercent = NO;
        [self addSubview:_starRateView];
        
        //数量Label
        _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 80, kScreenWidth-120, 30)];
        [_numLabel setAdjustsFontSizeToFitWidth:YES];
        [_numLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [_numLabel setTextColor:UIColorFromHex(0x333333, 1)];
        [self.contentView addSubview:_numLabel];
        
        // 分割线
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 119, kScreenWidth, 1)];
        line.backgroundColor = UIColorFromHex(0xf421ae, 1);
        [self addSubview:line];
        
    }
    
    return self;
}


@end
