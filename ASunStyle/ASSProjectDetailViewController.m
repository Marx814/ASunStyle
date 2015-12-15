//
//  ASSProjectDetailViewController.m
//  ASunStyle
//
//  Created by Marx on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSProjectDetailViewController.h"


@implementation ASSProjectDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:UIColorFromHex(0xfed7ed, 1)];
    [self customView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestProjectData];
}

#pragma mrak RequestProjectData
- (void)requestProjectData
{
    NSDictionary *parameter =@{@"id":_projectID};
    [ASSNetWoringHttpRequestManager requestInterfaceWithParameters:parameter andURL:ASSProjectDetailUrl andBlock:^(ASSHttpState state, NSDictionary *responseDictionary) {
        if (state == ASSHttpStateOK) {
            _projectDic = responseDictionary[@"data"];
            _bannerArray = @[[NSString stringWithFormat:@"%@%@",@"http://app.gudaochina.com",_projectDic[@"project_banner"]]];
            [_bannerView reloadDataWithCompleteBlock:^{
                
            }];
            [_priceLabel setText:[NSString stringWithFormat:@"¥%@",_projectDic[@"project_price"]]];
            [_actualPriceLabel setText:[NSString stringWithFormat:@"实际价格：¥%@",_projectDic[@"project_price"]]];
            [_saleLabel setText:[NSString stringWithFormat:@"%@人做过",_projectDic[@"sales_volume"]]];
            [_introductionLabel setText:[NSString stringWithFormat:@"%@",_projectDic[@"project_desc"]]];
            [_durationLabel setText:[NSString stringWithFormat:@"耗时：%@分钟",_projectDic[@"usetime"]]];
            [_productLabel setText:[NSString stringWithFormat:@"使用产品：%@",_projectDic[@"use_project"]]];
            
        }else{
            
        }
    }];
}

#pragma mark CustomView
- (void)customView
{
    [self.view addSubview:self.scrollView];
    [_scrollView addSubview:self.filterView];
    [_scrollView addSubview:self.bannerView];
    [_scrollView addSubview:self.infoView];
    [_scrollView addSubview:self.reservationInfoView];
    [_scrollView addSubview:self.choiceHairdresserButton];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = ({
            UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavigationBarHight-kTabbarHight)];
            [scrollView setBackgroundColor:[UIColor clearColor]];
            
            scrollView;
        });
    }
    return _scrollView;
}

- (UIView *)filterView
{
    if(!_filterView){
        _filterView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
            [view setBackgroundColor:[UIColor whiteColor]];
            
            NSArray *array = @[@"发型展示",@"视频展示"];
            
            for (int i = 0; i < 2; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setTag:100+i];
                [button setFrame:CGRectMake(kScreenWidth/2*i, 0, kScreenWidth/2, 40)];
                [button setTitle:array[i] forState:UIControlStateNormal];
                [button setTitleColor:UIColorFromHex(0x000000, 1) forState:UIControlStateNormal];
                [button setTitleColor:UIColorFromHex(0xf00093, 1) forState:UIControlStateSelected];
                [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
                
                if (i == 0) {
                    [button setSelected:YES];
                    _selectedButton = button;
                }
                
                [view addSubview:button];
            }
            
            view;
        });
    }
    
    return _filterView;
}

- (KDCycleBannerView *)bannerView
{
    if (!_bannerView) {
        _bannerView = ({
            KDCycleBannerView *bannerView = [[KDCycleBannerView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, 160)];
            [bannerView setDelegate:self];
            [bannerView setDatasource:self];
            [bannerView setBackgroundColor:[UIColor whiteColor]];
            [bannerView setContinuous:YES];
            [bannerView setAutoPlayTimeInterval:4.0];
            bannerView;
        });
    }
    return _bannerView;
}

- (UIView *)infoView
{
    if (!_infoView) {
        _infoView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 210, kScreenWidth, 170)];
            [view setBackgroundColor:[UIColor whiteColor]];
            [view.layer setMasksToBounds:YES];
            [view.layer setBorderColor:UIColorFromHex(0xee008d, 1).CGColor];
            [view.layer setBorderWidth:0.5];
            
            _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, (kScreenWidth-20)/2, 20)];
            [_priceLabel setBackgroundColor:[UIColor clearColor]];
            [_priceLabel setTextColor:UIColorFromHex(0x6f6f6f, 1)];
            [_priceLabel setFont:[UIFont systemFontOfSize:14]];
            [_priceLabel setText:@"¥0.00"];
            [view addSubview:_priceLabel];
            
            _actualPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, (kScreenWidth-20)/2, 20)];
            [_actualPriceLabel setBackgroundColor:[UIColor clearColor]];
            [_actualPriceLabel setTextColor:UIColorFromHex(0x6f6f6f, 1)];
            [_actualPriceLabel setFont:[UIFont systemFontOfSize:14]];
            [_actualPriceLabel setText:@"实际价格：¥0.00"];
            [view addSubview:_actualPriceLabel];
            
            _saleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2, 25, (kScreenWidth-20)/2, 20)];
            [_saleLabel setBackgroundColor:[UIColor clearColor]];
            [_saleLabel setTextAlignment:NSTextAlignmentRight];
            [_saleLabel setTextColor:UIColorFromHex(0x6f6f6f, 1)];
            [_saleLabel setFont:[UIFont systemFontOfSize:14]];
            [_saleLabel setText:@"0人做过"];
            [view addSubview:_saleLabel];
            
            UIView *lineView_0 = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, kScreenWidth, 0.5)];
            [lineView_0 setBackgroundColor:UIColorFromHex(0xee008d, 1)];
            [view addSubview:lineView_0];
            
            UILabel *introductionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, 80, 20)];
            [introductionLabel setBackgroundColor:[UIColor clearColor]];
            [introductionLabel setTextColor:UIColorFromHex(0x000000, 1)];
            [introductionLabel setFont:[UIFont systemFontOfSize:16]];
            [introductionLabel setText:@"项目说明："];
            [view addSubview:introductionLabel];
            
            _introductionLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 55, kScreenWidth-100, 20)];
            [_introductionLabel setBackgroundColor:[UIColor clearColor]];
            [_introductionLabel setTextColor:UIColorFromHex(0x6f6f6f, 1)];
            [_introductionLabel setFont:[UIFont systemFontOfSize:14]];
            [_introductionLabel setNumberOfLines:0];
            [view addSubview:_introductionLabel];
            
            UIView *lineView_1 = [[UIView alloc] initWithFrame:CGRectMake(0, 129.5, kScreenWidth, 0.5)];
            [lineView_1 setBackgroundColor:UIColorFromHex(0xee008d, 1)];
            [view addSubview:lineView_1];
            
            _durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, (kScreenWidth-20)/2, 20)];
            [_durationLabel setBackgroundColor:[UIColor clearColor]];
            [_durationLabel setTextColor:UIColorFromHex(0x6f6f6f, 1)];
            [_durationLabel setFont:[UIFont systemFontOfSize:14]];
            [_durationLabel setText:@"耗时：0分钟"];
            [view addSubview:_durationLabel];
            
            _productLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2, 140, (kScreenWidth-20)/2, 20)];
            [_productLabel setBackgroundColor:[UIColor clearColor]];
            [_productLabel setTextAlignment:NSTextAlignmentRight];
            [_productLabel setTextColor:UIColorFromHex(0x6f6f6f, 1)];
            [_productLabel setFont:[UIFont systemFontOfSize:14]];
            [_productLabel setText:@"使用产品："];
            [view addSubview:_productLabel];
            
            view;
        });
    }
    return _infoView;
}

- (UIView *)reservationInfoView
{
    if (!_reservationInfoView) {
        _reservationInfoView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 380, kScreenWidth, 80)];
            [view setBackgroundColor:[UIColor clearColor]];
            [view.layer setMasksToBounds:YES];
            [view.layer setBorderColor:UIColorFromHex(0xee008d, 1).CGColor];
            [view.layer setBorderWidth:0.5];
            
            UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(30, 5, kScreenWidth-60, 70)];
            [buttonView setBackgroundColor:[UIColor whiteColor]];
            [buttonView.layer setMasksToBounds:YES];
            [buttonView.layer setBorderColor:UIColorFromHex(0xee008d, 1).CGColor];
            [buttonView.layer setBorderWidth:0.5];
            [view addSubview:buttonView];
            
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 34.75, kScreenWidth-30, 0.5)];
            [lineView setBackgroundColor:UIColorFromHex(0xee008d, 1)];
            [buttonView addSubview:lineView];
            
            for (int i = 0; i<2; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setFrame:CGRectMake(0, 35*i, kScreenWidth-60, 35)];
                [button setTag:400+i];
                [buttonView addSubview:button];
                if (i == 0) {
                    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, kScreenWidth - 130, 25)];
                    [_timeLabel setBackgroundColor:[UIColor clearColor]];
                    [_timeLabel setTextColor:UIColorFromHex(0x000000, 1)];
                    [_timeLabel setFont:[UIFont systemFontOfSize:14]];
                    [_timeLabel setText:@"预约时间"];
                    [button addSubview:_timeLabel];
                }else{
                    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, kScreenWidth - 130, 25)];
                    [_addressLabel setBackgroundColor:[UIColor clearColor]];
                    [_addressLabel setTextColor:UIColorFromHex(0x000000, 1)];
                    [_addressLabel setFont:[UIFont systemFontOfSize:14]];
                    [_addressLabel setText:@"服务地址"];
                    [button addSubview:_addressLabel];
                }
                
                UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 90, 7, 14, 21)];
                [arrowImageView setImage:[UIImage imageNamed:@"order_arrow"]];
                [button addSubview:arrowImageView];
                
                [button addTarget:self action:@selector(selectReservationInfoButton:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            view;
        });
    }
    return _reservationInfoView;
}

- (UIButton *)choiceHairdresserButton
{
    if (!_choiceHairdresserButton) {
        _choiceHairdresserButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(30, 500, kScreenWidth-60, 40)];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:2.5];
            [button setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xee008d, 1)  size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [button setTitle:@"选择美发师" forState:UIControlStateNormal];
            button;
        });
    }
    
    return _choiceHairdresserButton;
}



#pragma mark KDCycleBannerViewDataSource
- (NSArray *)numberOfKDCycleBannerView:(KDCycleBannerView *)bannerView
{
    return _bannerArray;
}

- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index {
    return UIViewContentModeScaleAspectFit;
}


#pragma mark KDCycleBannerViewDelegate
- (void)cycleBannerView:(KDCycleBannerView *)bannerView didSelectedAtIndex:(NSUInteger)index
{
    
}

#pragma mark Button Action
- (IBAction)selectReservationInfoButton:(UIButton *)sender
{
    switch (sender.tag) {
        case 400:
        {
            ASSReservationDateViewViewController *vc = [ASSReservationDateViewViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end
