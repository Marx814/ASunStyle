//
//  ASSHomeViewController.m
//  ASunStyle
//
//  Created by Marx on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSHomeViewController.h"

@interface ASSHomeViewController ()

@end

@implementation ASSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.refresh = YES;
    [self customView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.refresh) {
        [self requestBannerData];
        
        self.refresh = NO;
    }
    
}

#pragma mark RequestData
- (void)requestBannerData
{
    [ASSNetWoringHttpRequestManager requestInterfaceWithParameters:nil andURL:ASSBannerUrl andBlock:^(ASSHttpState state, NSDictionary *responseDictionary) {
        if (state == ASSHttpStateOK) {
            _bannerArray = responseDictionary[@"data"];
            [_bannerView reloadDataWithCompleteBlock:^{
                
            }];
        }else{
            
        }
    }];
}


#pragma mark Custom View
- (void)customView
{
    [self.view addSubview:self.bannerView];
    [self.view addSubview:self.serviceButton];
    [self.view addSubview:self.storeButton];
    [self.view addSubview:self.hairdresserButton];
    [self.view addSubview:self.orderButton];
    
}

- (KDCycleBannerView *)bannerView
{
    if (!_bannerView) {
        _bannerView = ({
            KDCycleBannerView *bannerView = [[KDCycleBannerView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth,200*kWR)];
            [bannerView setDatasource:self];
            [bannerView setDelegate:self];
            [bannerView setBackgroundColor:[UIColor clearColor]];
            [bannerView setContinuous:YES];
            [bannerView setAutoPlayTimeInterval:4.0];
            bannerView;
        });
    }
    
    return _bannerView;
}

- (UIButton *)serviceButton
{
    if (!_serviceButton) {
        _serviceButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTag:100];
            [button setFrame:CGRectMake(5*kWR, 205*kWR, 150*kWR, kScreenHeight - kNavigationBarHight -kTabbarHight -10*kWR - 200*kWR)];
            [button setBackgroundColor:UIColorFromHex(0xffcafd, 1)];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:5*kWR];
            [button.layer setBorderWidth:1*kWR];
            [button.layer setBorderColor:UIColorFromHex(0xf0009b, 1).CGColor];
            [button setTitle:@"预约选择" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [button setImage:[UIImage imageNamed:@"home_service_button"] forState:UIControlStateNormal];
            [button setTitleColor:UIColorFromHex(0x210b38, 1) forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(selectHomeButton:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _serviceButton;
}

- (UIButton *)storeButton
{
    if (!_storeButton) {
        _storeButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTag:101];
            [button setFrame:CGRectMake(160*kWR, 205*kWR, 155*kWR, (kScreenHeight - kNavigationBarHight -kTabbarHight -20*kWR - 200*kWR)/3)];
            [button setBackgroundColor:UIColorFromHex(0xf8e1ff, 1)];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:5*kWR];
            [button.layer setBorderWidth:1*kWR];
            [button.layer setBorderColor:UIColorFromHex(0xf0009b, 1).CGColor];
            [button setTitle:@"店面选择" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [button setImage:[UIImage imageNamed:@"home_store_button"] forState:UIControlStateNormal];
            [button setTitleColor:UIColorFromHex(0x210b38, 1) forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(selectHomeButton:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _storeButton;
}

- (UIButton *)hairdresserButton
{
    if (!_hairdresserButton) {
        _hairdresserButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTag:102];
            [button setFrame:CGRectMake(160*kWR, 210*kWR+_storeButton.frame.size.height, 155*kWR, (kScreenHeight - kNavigationBarHight -kTabbarHight -20*kWR - 200*kWR)/3)];
            [button setBackgroundColor:UIColorFromHex(0xfff0d1, 1)];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:5*kWR];
            [button.layer setBorderWidth:1*kWR];
            [button.layer setBorderColor:UIColorFromHex(0xf0009b, 1).CGColor];
            [button setTitle:@"美发师选择" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [button setImage:[UIImage imageNamed:@"home_hairdresser_button"] forState:UIControlStateNormal];
            [button setTitleColor:UIColorFromHex(0x210b38, 1) forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(selectHomeButton:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _hairdresserButton;
}

- (UIButton *)orderButton
{
    if (!_orderButton) {
        _orderButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTag:103];
            [button setFrame:CGRectMake(160*kWR, 215*kWR+_storeButton.frame.size.height*2, 155*kWR, (kScreenHeight - kNavigationBarHight -kTabbarHight -20*kWR - 200*kWR)/3)];
            [button setBackgroundColor:UIColorFromHex(0xe4fffe, 1)];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:5*kWR];
            [button.layer setBorderWidth:1*kWR];
            [button.layer setBorderColor:UIColorFromHex(0xf0009b, 1).CGColor];
            [button setTitle:@"我的订单" forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [button setImage:[UIImage imageNamed:@"home_order_button"] forState:UIControlStateNormal];
            [button setTitleColor:UIColorFromHex(0x210b38, 1) forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(selectHomeButton:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _orderButton;
}

#pragma mark KDCycleBannerViewDataSource
- (NSArray *)numberOfKDCycleBannerView:(KDCycleBannerView *)bannerView
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i<[_bannerArray count]; i++) {
        [array addObject:[NSString stringWithFormat:@"%@%@",_bannerArray[i][@"url"],_bannerArray[i][@"pic"]]];
    }
    return array;
}

- (UIViewContentMode)contentModeForImageIndex:(NSUInteger)index {
    return UIViewContentModeScaleToFill;
}

#pragma mark Button Action
- (IBAction)selectHomeButton:(UIButton *)sender
{
    if (sender.tag == 102) {
        ASSHairdresserListViewController *vc = [ASSHairdresserListViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
