//
//  HairdresListCell.h
//  ASunStyle
//
//  Created by soldier on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWStarRateView.h"

@interface HairdresListCell : UITableViewCell

@property (nonatomic ,strong) UIImageView *headImgV;
@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UILabel *numLabel;
@property (nonatomic ,strong) CWStarRateView *starRateView;


@end
