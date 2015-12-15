//
//  AddressCell.m
//  ASunStyle
//
//  Created by soldier on 15/10/27.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "AddressCell.h"

@implementation AddressCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
        [topView setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
        [self addSubview:topView];
        
        // 分割线
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 9, kScreenWidth, 1)];
        line.backgroundColor = UIColorFromHex(0xf421ae, 1);
        [self addSubview:line];
        
        // 用户名Label
        _uNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 25, kScreenWidth/2-16 , 20)];
        [_uNameLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [_uNameLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
        [self.contentView addSubview:_uNameLabel];
        
        // 电话Label
        _phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2, 25, kScreenWidth/2, 20)];
        [_phoneLabel setAdjustsFontSizeToFitWidth:YES];
        [_phoneLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [_phoneLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
        [self.contentView addSubview:_phoneLabel];
        
        // 省市Label
        _cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 45, kScreenWidth-100, 20)];
        [_cityLabel setAdjustsFontSizeToFitWidth:YES];
        [_cityLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [_cityLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
        [self.contentView addSubview:_cityLabel];
        
        // 地址Label
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 65, kScreenWidth-100, 20)];
        [_addressLabel setAdjustsFontSizeToFitWidth:YES];
        [_addressLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [_addressLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
        [self.contentView addSubview:_addressLabel];
        
        //邮编 Label
        _codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 85, kScreenWidth-100, 20)];
        [_codeLabel setAdjustsFontSizeToFitWidth:YES];
        [_codeLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [_codeLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
        [self.contentView addSubview:_codeLabel];
        
        //箭头
        UIImageView *arrowImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 30, 125/2, 10, 15)];
        [arrowImgView setImage:[UIImage imageNamed:@"personal_arrow"]];
        [self.contentView addSubview:arrowImgView];
        
        line = [[UIView alloc] initWithFrame:CGRectMake(0, 124, kScreenWidth, 1)];
        line.backgroundColor = UIColorFromHex(0xf421ae, 1);
        [self addSubview:line];
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
