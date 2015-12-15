//
//  CommentCell.h
//  ASunStyle
//
//  Created by soldier on 15/11/5.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommentCellDelegate <NSObject>

@end

@interface CommentCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImgV;
@property (nonatomic, strong) UILabel *commentTitle;
@property (nonatomic, strong) UILabel *commentHairdresser;
@property (nonatomic, strong) UILabel *commentContent;

@end
