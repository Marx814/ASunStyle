//
//  ASSPersonalViewController.m
//  ASunStyle
//
//  Created by Marx on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSPersonalViewController.h"
#import "ASSUserModel.h"

@interface ASSPersonalViewController ()

@end

@implementation ASSPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setTopCustomView];
    [self setMiddleCustomView];
    [self setBottomCustomView];
    
}

//
- (void)setTopCustomView
{
    //头像
    UIImageView *headImgV = [[UIImageView alloc] initWithFrame:CGRectMake(17, 34, 48, 48)];
    headImgV.layer.masksToBounds = YES;
    headImgV.layer.cornerRadius = 24.0f;
    [headImgV setImage:[UIImage imageNamed:@"personal_head"]];
    [self.view addSubview:headImgV];
    
    //用户名
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, 180, 15)];
    [nameLabel setText:@"高圆圆"];
    [nameLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [nameLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:nameLabel];
    
    //账户余额
    UILabel *balanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, 180, 10)];
    [balanceLabel setText:@"账户余额：6487"];
    [balanceLabel setFont:[UIFont systemFontOfSize:11.0f]];
//    [balanceLabel setTextColor:UIColorFromHex(0x3222222, 1)];
    [self.view addSubview:balanceLabel];
    
    //箭头
    UIImageView *arrowImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 35, 53, 14, 21)];
    [arrowImgV setImage:[UIImage imageNamed:@"personal_arrow"]];
    [self.view addSubview:arrowImgV];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 124, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    UIButton *personCenterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [personCenterBtn setFrame:CGRectMake(0, 0, kScreenWidth, 125)];
    [personCenterBtn setBackgroundColor:[UIColor clearColor]];
    [personCenterBtn addTarget:self action:@selector(clickPersonCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:personCenterBtn];
}

- (void)setMiddleCustomView
{
    NSArray *titleArray = @[@"我的抵用券",@"我的收藏"];
    NSArray *imgArray  = @[@"personal_ mortgage",@"personal_collection"];
    for (int i = 0; i<2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(i*kScreenWidth/2, 125, kScreenWidth/2, 80)];
        [button setTag:(100+i)];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(clickPersonalBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        UIImageView *btnImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 30, 30)];
        [btnImgV setImage:[UIImage imageNamed:imgArray[i]]];
        [button addSubview:btnImgV];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, (80-13)/2, 70, 13)];
        [titleLabel setText:titleArray[i]];
        [titleLabel setFont:[UIFont systemFontOfSize:13]];
        [button addSubview:titleLabel];
    }
    
    UIView *separateLineV = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth/2, 125 +(80-64)/2, 1, 64)];
    [separateLineV setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:separateLineV];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 204, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
}

- (void)setBottomCustomView
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 214 , kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    NSArray *titleArray = @[@"我的订单",@"我的评价",@"会员俱乐部",@"活动中心"];
    NSArray *imgArray  = @[@"personal_order",@"personal_comment",@"personal_memberclub",@"personal_actioncenter"];
    
    for (int i = 0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(0, 215 + i*45, kScreenWidth, 44)];
        [button setTag:(102+i)];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(clickPersonalBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        UIImageView *btnImgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, (44-25)/2, 25, 25)];
        [btnImgV setImage:[UIImage imageNamed:imgArray[i]]];
        [button addSubview:btnImgV];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, (44-12)/2, 70, 12)];
        [titleLabel setText:titleArray[i]];
        [titleLabel setFont:[UIFont systemFontOfSize:12]];
        [button addSubview:titleLabel];
        
        lineView = [[UIView alloc] initWithFrame:CGRectMake(0, button.frame.size.height + button.frame.origin.y , kScreenWidth, 1)];
        [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
        [self.view addSubview:lineView];
    }
}


#pragma mark -- 我的抵用券和收藏
- (void)clickPersonalBtn:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 100:
            NSLog(@"点击“我的抵用券”按钮");
            break;
        case 101:
            NSLog(@"点击“我的收藏”按钮");
        {
            MyCollectionViewController *myCollectionVC = [[MyCollectionViewController alloc] init];
            [myCollectionVC setTitle:@"我的收藏"];
            [self.navigationController pushViewController:myCollectionVC animated:YES];
        }
            break;
        case 102:
            NSLog(@"点击“我的订单”按钮");
        {
            MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
            [myOrderVC setTitle:@"我的订单"];
            [self.navigationController pushViewController:myOrderVC animated:YES];
        }
            break;
        case 103:
            NSLog(@"点击“我的评价”按钮");
        {
            MyCommentViewController *myCommentVC = [[MyCommentViewController alloc] init];
            [myCommentVC setTitle:@"我的评价"];
            [self.navigationController pushViewController:myCommentVC animated:YES];
        }
            break;
        case 104:
            NSLog(@"点击“会员俱乐部”按钮");
            break;
        case 105:
            NSLog(@"点击“活动中心”按钮");
            break;
            
        default:
            break;
    }
}

#pragma mark -- 个人中心
- (void)clickPersonCenterBtn:(id)sender
{
    if ([ASSUserModel ifLogin]) {
        PersonCenterViewController *personCenterVC = [[PersonCenterViewController alloc] init];
        [personCenterVC setTitle:@"个人中心"];
        [self.navigationController pushViewController:personCenterVC animated:YES];
    }else
    {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [loginVC setTitle:@"登录"];
        [self.navigationController pushViewController:loginVC animated:YES];
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
