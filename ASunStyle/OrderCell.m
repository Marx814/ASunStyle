//
//  OrderCell.m
//  ASunStyle
//
//  Created by soldier on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColorFromHex(0xfde0f0, 1);
        
        // 分割线
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, 84, kScreenWidth, 1)];
        line.backgroundColor = UIColorFromHex(0xf421ae, 1);
        [self addSubview:line];
        
        //头像
        _headImgV = [[UIImageView alloc] init];
        [_headImgV setFrame:CGRectMake(15, 12, 60, 60)];
        _headImgV.layer.borderWidth = 0.5f;
        _headImgV.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
        _headImgV.layer.cornerRadius = 30.0f;
        [_headImgV.layer setMasksToBounds:YES];
        [_headImgV setImage:[UIImage imageNamed:@"personal_head"]];
        [self addSubview:_headImgV];
        
        // 标题Label
        _orderTitle = [[UILabel alloc] initWithFrame:CGRectMake(85, 7, kScreenWidth-100 , 15)];
        [_orderTitle setFont:[UIFont systemFontOfSize:13.0f]];
        [_orderTitle setTextColor:UIColorFromHex(0x333333, 1)];
        [self.contentView addSubview:_orderTitle];
        
        // 时间Label
        _orderDate = [[UILabel alloc] initWithFrame:CGRectMake(85, 35, 150, 15)];
        [_orderDate setAdjustsFontSizeToFitWidth:YES];
        [_orderDate setFont:[UIFont systemFontOfSize:11.0f]];
        [_orderDate setTextColor:UIColorFromHex(0x333333, 1)];
        [self.contentView addSubview:_orderDate];
        
        // 价格Label
        _orderPrice = [[UILabel alloc] initWithFrame:CGRectMake(85, 50, 150, 15)];
        [_orderPrice setAdjustsFontSizeToFitWidth:YES];
        [_orderPrice setFont:[UIFont systemFontOfSize:11.0f]];
        [_orderPrice setTextColor:UIColorFromHex(0x333333, 1)];
        [self.contentView addSubview:_orderPrice];
        
        // 美发师Label
        _orderHairdresser = [[UILabel alloc] initWithFrame:CGRectMake(85, 65, 150, 15)];
        [_orderHairdresser setAdjustsFontSizeToFitWidth:YES];
        [_orderHairdresser setFont:[UIFont systemFontOfSize:11.0f]];
        [_orderHairdresser setTextColor:UIColorFromHex(0x333333, 1)];
        [self.contentView addSubview:_orderHairdresser];
        
        //状态 按钮
        _orderStateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orderStateBtn setFrame:CGRectMake(kScreenWidth-70, 55, 55, 15)];
        [_orderStateBtn setBackgroundColor:[UIColor whiteColor]];
        _orderStateBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        _orderStateBtn.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
        _orderStateBtn.layer.borderWidth = 0.5;
        [_orderStateBtn setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];
        [_orderStateBtn setTitle:@"未支付" forState:UIControlStateNormal];
        [self.contentView addSubview:_orderStateBtn];
        
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
