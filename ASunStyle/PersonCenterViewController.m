//
//  PersonCenterViewController.m
//  ASunStyle
//
//  Created by soldier on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "PersonCenterViewController.h"

@interface PersonCenterViewController ()

@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setPersonCenterCustomView];

}

- (void)setPersonCenterCustomView
{
    NSArray *titleArray = @[@"用户名字",@"账户余额",@"收货地址",@"已绑定手机号",@"绑定微信",@"登录密码",@"支付密码"];
    NSArray *imgArray = @[@"personcenter_name",@"personcenter_balance",@"personcenter_address",@"personcenter_phone",@"personcenter_weixin",@"personcenter_password",@"personcenter_payment"];
    NSArray *clickArray = @[@"修改",@"充值",@"增加/修改",@"更换",@"修改",@"修改",@"修改"];
    
    for (int i = 0; i<7 ; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(clickPersonCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:(100+i)];
        [self.view addSubview:button];
        
        if (i<3) {
            [button setFrame:CGRectMake(0, 20 + i*40, kScreenWidth, 40)];
        }else
        {
            [button setFrame:CGRectMake(0, 40 + i*40, kScreenWidth, 40)];
        }
        
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(18, 10, 26, 19)];
        [imgV setImage:[UIImage imageNamed:imgArray[i]]];
        [button addSubview:imgV];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 80, 20)];
        [titleLabel setText:titleArray[i]];
        [titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [button addSubview:titleLabel];
        
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-90, 10, 60, 20)];
        [rightLabel setText:clickArray[i]];
        [rightLabel setTextAlignment:NSTextAlignmentRight];
        [rightLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
        [rightLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [button addSubview:rightLabel];
        
        UIImageView *arrowImgV = [[UIImageView alloc] initWithFrame:CGRectMake(rightLabel.frame.origin.x + rightLabel.frame.size.width+5, 13, 8, 12)];
        [arrowImgV setImage:[UIImage imageNamed:@"personcenter_arrow"]];
        [button addSubview:arrowImgV];
    }

    for (int i = 0; i<9 ; i++) {
        UIView *lineView = [[UIView alloc] init];
        [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
        [self.view addSubview:lineView];
        if (i<4) {
            [lineView setFrame:CGRectMake(0, 19 + i*40, kScreenWidth, 1)];
        }else
        {
            [lineView setFrame:CGRectMake(0, 39 + (i-1)*40, kScreenWidth, 1)];
        }
    }

    //华丽的分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-64-62, kScreenWidth, 2)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    UIView *logOffBgView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-64-60, kScreenWidth, 60)];
    [logOffBgView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:logOffBgView];
    
    UIButton *logOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [logOutBtn setFrame:CGRectMake(60, 20, kScreenWidth-120, 20)];
    [logOutBtn setBackgroundImage:[UIImage imageNamed:@"personcenter_logout"] forState:UIControlStateNormal];
    [logOutBtn addTarget:self action:@selector(clickLogOutBtn:) forControlEvents:UIControlEventTouchUpInside];
    [logOffBgView addSubview:logOutBtn];
    
}

#pragma mark --
- (void)clickPersonCenterBtn:(id)sender
{
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 100:
            NSLog(@"修改用户名");
        {
            ModifyUserNameViewController *modifyUNameVC = [[ModifyUserNameViewController alloc] init];
            [modifyUNameVC setTitle:@"修改用户名"];
            [self.navigationController pushViewController:modifyUNameVC animated:YES];
        }
            break;
        case 101:
            NSLog(@"用户余额充值");
            break;
        case 102:
            NSLog(@"修改收货地址");
        {
            ShipAddressViewController *shipAddressVC = [[ShipAddressViewController alloc] init];
            [shipAddressVC setTitle:@"收货地址"];
            [self.navigationController pushViewController:shipAddressVC animated:YES];
        }
            break;
        case 103:
            NSLog(@"修改绑定手机号");
            break;
        case 104:
            NSLog(@"修改绑定微信");
            break;
        case 105:
            NSLog(@"修改登录密码");
        {
            ModifyLoginPwViewController *modifyLoginPwVC = [[ModifyLoginPwViewController alloc] init];
            [modifyLoginPwVC setTitle:@"修改登录密码"];
            [self.navigationController pushViewController:modifyLoginPwVC animated:YES];
        }
            break;
        case 106:
            NSLog(@"修改支付密码");
            break;
            
        default:
            break;
    }
}

#pragma mark -- 注销账号
- (void)clickLogOutBtn:(id)sender
{
    NSLog(@"注销账号………………");
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"确定注销？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [ASSUserModel logoff];
        [self.navigationController popViewControllerAnimated:YES];
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
