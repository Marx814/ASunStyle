//
//  ASSHomeViewController.h
//  ASunStyle
//
//  Created by Marx on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"

//#import "ASSServiceViewController.h"
#import "KDCycleBannerView.h"
#import "ASSNetWoringHttpRequestManager.h"

#import "ASSHairdresserListViewController.h"

@interface ASSHomeViewController : ASSBaseViewController<KDCycleBannerViewDataSource,KDCycleBannerViewDelegate>

@property(nonatomic)UIBarButtonItem *cityBarButtonItem;
@property(nonatomic)UIBarButtonItem *customerServiceBarButtonItem;

//@property(nonatomic)UIScrollView *bannerScrollView;
@property(nonatomic)KDCycleBannerView *bannerView;
@property(nonatomic)NSArray *bannerArray;

@property(nonatomic)UIButton *serviceButton;
@property(nonatomic)UIButton *storeButton;
@property(nonatomic)UIButton *hairdresserButton;
@property(nonatomic)UIButton *orderButton;
@end
