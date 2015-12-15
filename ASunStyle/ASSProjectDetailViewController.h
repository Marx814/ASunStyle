//
//  ASSProjectDetailViewController.h
//  ASunStyle
//
//  Created by Marx on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"
#import "ASSNetWoringHttpRequestManager.h"
#import "KDCycleBannerView.h"
#import "UIImage+Color.h"

#import "ASSReservationDateViewViewController.h"

@interface ASSProjectDetailViewController : ASSBaseViewController<KDCycleBannerViewDataSource,KDCycleBannerViewDelegate>

@property(nonatomic)NSString *projectID;
@property(nonatomic)NSDictionary *projectDic;

@property(nonatomic)UIScrollView *scrollView;

@property(nonatomic)UIView *filterView;
@property(nonatomic)UIButton *selectedButton;
@property(nonatomic)KDCycleBannerView *bannerView;
@property(nonatomic)NSArray *bannerArray;

@property(nonatomic)UIWebView *videoWebView;

@property(nonatomic)UIView *infoView;
@property(nonatomic)UILabel *priceLabel;
@property(nonatomic)UILabel *actualPriceLabel;
@property(nonatomic)UILabel *saleLabel;
@property(nonatomic)UILabel *introductionLabel;
@property(nonatomic)UILabel *durationLabel;
@property(nonatomic)UILabel *productLabel;

@property(nonatomic)UIView *reservationInfoView;
@property(nonatomic)UILabel *timeLabel;
@property(nonatomic)UILabel *addressLabel;

@property(nonatomic)UIButton *choiceHairdresserButton;

@end
