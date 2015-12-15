//
//  OrderCell.h
//  ASunStyle
//
//  Created by soldier on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImgV;
@property (nonatomic, strong) UILabel *orderTitle;
@property (nonatomic, strong) UILabel *orderDate;
@property (nonatomic, strong) UILabel *orderPrice;
@property (nonatomic, strong) UILabel *orderHairdresser;
@property (nonatomic, strong) UIButton *orderStateBtn;

@end
