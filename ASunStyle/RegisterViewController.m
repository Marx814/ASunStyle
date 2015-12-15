//
//  RegisterViewController.m
//  ASunStyle
//
//  Created by soldier on 15/12/7.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setRegisterCustomView];
}

- (void)setRegisterCustomView
{
    UIView *bgView= [[UIView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, 140)];
    [bgView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:bgView];
    
    // 分隔线
    for (int i = 0; i<5; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 35*i, kScreenWidth, 1)];
        [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
        [bgView addSubview:lineView];
    }
    
    //电话号
    phoneTextF = [[UITextField alloc] initWithFrame:CGRectMake(15, 5, kScreenWidth -150, 25)];
    [phoneTextF setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
    [phoneTextF setDelegate:self];
    [phoneTextF setPlaceholder:@" 请输入手机号码"];
    [phoneTextF setTextColor:UIColorFromHex(0xf421ae, 1)];
    phoneTextF.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    phoneTextF.layer.borderWidth = 0.5f;
    [bgView addSubview:phoneTextF];
    
    //获取验证码按钮
    UIButton *verifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [verifyBtn setFrame:CGRectMake(phoneTextF.frame.size.width + phoneTextF.frame.origin.x + 20, 5, 100, 25)];
    [verifyBtn setImage:[UIImage imageNamed:@"register_ verifycard"] forState:UIControlStateNormal];
    [verifyBtn addTarget:self action:@selector(verifyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:verifyBtn];
    
    //验证码
    verifyCodeTextF = [[UITextField alloc] initWithFrame:CGRectMake(15, 40, kScreenWidth -30, 25)];
    [verifyCodeTextF setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
    [verifyCodeTextF setDelegate:self];
    [verifyCodeTextF setPlaceholder:@" 请填写验证码"];
    [verifyCodeTextF setTextColor:UIColorFromHex(0xf421ae, 1)];
    verifyCodeTextF.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    verifyCodeTextF.layer.borderWidth = 0.5f;
    [bgView addSubview:verifyCodeTextF];
    
    //密码
    passwordTextF = [[UITextField alloc] initWithFrame:CGRectMake(15, 75, kScreenWidth -30, 25)];
    [passwordTextF setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
    [passwordTextF setDelegate:self];
    [passwordTextF setPlaceholder:@" 请填写密码"];
    [passwordTextF setTextColor:UIColorFromHex(0xf421ae, 1)];
    passwordTextF.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    passwordTextF.layer.borderWidth = 0.5f;
    [bgView addSubview:passwordTextF];
    
    //确认密码
    confirmPwTextF = [[UITextField alloc] initWithFrame:CGRectMake(15, 110, kScreenWidth -30, 25)];
    [confirmPwTextF setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
    [confirmPwTextF setDelegate:self];
    [confirmPwTextF setPlaceholder:@" 请确认密码"];
    [confirmPwTextF setTextColor:UIColorFromHex(0xf421ae, 1)];
    confirmPwTextF.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    confirmPwTextF.layer.borderWidth = 0.5f;
    [bgView addSubview:confirmPwTextF];
    
    //注册按钮
    UIButton *rigisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rigisterBtn setFrame:CGRectMake((kScreenWidth - 100)/2, 180, 100, 20)];
    [rigisterBtn setImage:[UIImage imageNamed:@"register_btn"] forState:UIControlStateNormal];
    [rigisterBtn addTarget:self action:@selector(rigisterBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rigisterBtn];
    
}


//发送 短信 验证 接口
- (void)verifyBtnClick
{
    if (phoneTextF.text != nil) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

        NSDictionary *dict = @{@"phone": phoneTextF.text};
        
        [manager POST:@"http://app.gudaochina.com/index.php/Api/SMS/sendmessage" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    else
    {
        NSLog(@"请输入 电话号码");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请输入电话号码" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

//发送 注册 接口
- (void)rigisterBtnClick
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"phone": phoneTextF.text,@"password":passwordTextF.text,@"ckpassword":confirmPwTextF.text,@"yzm":verifyCodeTextF.text};
    
    [manager POST:@"http://app.gudaochina.com/index.php/Api/Member/memberReg" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        if ([responseObject[@"code"] integerValue] == 1000) {
            NSLog(@"注册成功");
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];

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
