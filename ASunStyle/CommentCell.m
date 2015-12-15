//
//  CommentCell.m
//  ASunStyle
//
//  Created by soldier on 15/11/5.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColorFromHex(0xfde0f0, 1);
        
        // 分割线
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 84, kScreenWidth, 1)];
        line.backgroundColor = UIColorFromHex(0xf421ae, 1);
        [self addSubview:line];
        
        //头像
        _headImgV = [[UIImageView alloc] init];
        [_headImgV setFrame:CGRectMake(25, 12, 60, 60)];
        _headImgV.layer.borderWidth = 0.5f;
        _headImgV.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
        _headImgV.layer.cornerRadius = 30.0f;
        [_headImgV.layer setMasksToBounds:YES];
        [_headImgV setImage:[UIImage imageNamed:@"personal_head"]];
        [self addSubview:_headImgV];
        
        // 标题Label
        _commentTitle = [[UILabel alloc] initWithFrame:CGRectMake(100, 7, kScreenWidth-100 , 35)];
        [_commentTitle setFont:[UIFont systemFontOfSize:13.0f]];
        [_commentTitle setTextColor:UIColorFromHex(0x333333, 1)];
        [self.contentView addSubview:_commentTitle];
        
        // 美发师Label
        _commentHairdresser = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 150, 15)];
        [_commentHairdresser setAdjustsFontSizeToFitWidth:YES];
        [_commentHairdresser setFont:[UIFont systemFontOfSize:11.0f]];
        [_commentHairdresser setTextColor:UIColorFromHex(0x333333, 1)];
        [self.contentView addSubview:_commentHairdresser];
        
        // 评价Label
        _commentContent = [[UILabel alloc] initWithFrame:CGRectMake(100, 65, 150, 15)];
        [_commentContent setAdjustsFontSizeToFitWidth:YES];
        [_commentContent setFont:[UIFont systemFontOfSize:11.0f]];
        [_commentContent setTextColor:UIColorFromHex(0x333333, 1)];
        [self.contentView addSubview:_commentContent];
        
        UIView *shareView = [[UIView alloc] initWithFrame:CGRectMake(0, 85, kScreenWidth, 40)];
        [shareView setBackgroundColor:[UIColor whiteColor]];
        [self.contentView addSubview:shareView];
        
        UILabel *shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-100, 40)];
        [shareLabel setAdjustsFontSizeToFitWidth:YES];
        [shareLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [shareLabel setText:@"分享美获积分"];
        [shareLabel setTextAlignment:NSTextAlignmentRight];
        [shareLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
        [shareView addSubview:shareLabel];
        
        UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-90, 7, 80, 25)];
        [shareBtn setBackgroundImage:[UIImage imageNamed:@"comment_shareBtn"] forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
        [shareView addSubview:shareBtn];
        
    }
    
    return self;
}

- (void)clickShareBtn:(id)sender
{
    NSLog(@"分享 按钮");
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
