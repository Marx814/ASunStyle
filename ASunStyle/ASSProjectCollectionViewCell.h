//
//  ASSProjectCollectionViewCell.h
//  ASunStyle
//
//  Created by Marx on 15/12/13.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"

@interface ASSProjectCollectionViewCell : UICollectionViewCell

@property(nonatomic)UIImageView *projectImageView;
@property(nonatomic)UILabel *projectNameLabel;
@property(nonatomic)UILabel *projectPriceLabel;
@property(nonatomic)UILabel *projectSaleLabel;

@end
