//
//  ASSHairdresserListViewController.h
//  ASunStyle
//
//  Created by soldier on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"
#import "ASSNetWoringHttpRequestManager.h"
#import "UIImageView+AFNetworking.h"
#import "HairdresListCell.h"
#import "ASSHairdressViewController.h"


@interface ASSHairdresserListViewController : ASSBaseViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *hairdresTableView;
@property (nonatomic, strong) UIView       *topView;

@property (nonatomic, strong) NSMutableArray *hairdressListArray;
@property (nonatomic, strong) NSString      *zongheType;
@property (nonatomic, strong) NSString      *renqiType;
@property (nonatomic, strong) NSString      *xinrenType;

@end
