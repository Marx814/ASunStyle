//
//  LoginViewController.m
//  ASunStyle
//
//  Created by soldier on 15/12/7.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ASSUserModel.h"

@interface LoginViewController () <UITextFieldDelegate>
{
    UIImageView *bgImgView;
    UITextField *nameTextF;                    //用户名
    UITextField *pwTextF;                       //密码
}


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setLoginCustomView];
}

//登录界面
- (void)setLoginCustomView
{
    //背景图
    bgImgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [bgImgView setImage:[UIImage imageNamed:@"login_bg"]];
    [bgImgView setUserInteractionEnabled:YES];
    [self.view addSubview:bgImgView];
    
    //logo
    UIImageView *logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - 110)/2, 80, 110, 110)];
    [logoImgView setImage:[UIImage imageNamed:@"login_logo"]];
    [bgImgView addSubview:logoImgView];
    
    //用户名
    UIImageView *nameImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 315, 20, 20)];
    [nameImgView setImage:[UIImage imageNamed:@"login_name"]];
    [bgImgView addSubview:nameImgView];
    
    nameTextF = [[UITextField alloc] initWithFrame:CGRectMake(45, 300, kScreenWidth - 50, 50)];
//    [nameTextF setBackgroundColor:[UIColor clearColor]];
    [nameTextF setDelegate:self];
    [nameTextF setPlaceholder:@" 用户名"];
    [nameTextF setTextColor:[UIColor whiteColor]];
    [bgImgView addSubview:nameTextF];
    
    //分隔线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 349, kScreenWidth, 1)];
    [lineView setBackgroundColor:[UIColor whiteColor]];
    [bgImgView addSubview:lineView];
    
    //密码
    UIImageView *pwImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 365, 20, 20)];
    [pwImgView setImage:[UIImage imageNamed:@"login_pw"]];
    [bgImgView addSubview:pwImgView];
    
    pwTextF = [[UITextField alloc] initWithFrame:CGRectMake(45, 350, kScreenWidth - 50, 50)];
    //    [nameTextF setBackgroundColor:[UIColor clearColor]];
    [pwTextF setDelegate:self];
    [pwTextF setPlaceholder:@" 密码"];
    [pwTextF setTextColor:[UIColor whiteColor]];
    [bgImgView addSubview:pwTextF];
    
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 399, kScreenWidth, 1)];
    [lineView setBackgroundColor:[UIColor whiteColor]];
    [bgImgView addSubview:lineView];
    
    //记住密码
    UIButton *rememberPwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rememberPwBtn setFrame:CGRectMake(kScreenWidth-100, 405, 80, 20)];
    [rememberPwBtn setImage:[UIImage imageNamed:@"login_pw"] forState:UIControlStateNormal];
    [rememberPwBtn setTitle:@"记住密码" forState:UIControlStateNormal];
    rememberPwBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    rememberPwBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rememberPwBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10.0, 0, 0);
    [rememberPwBtn addTarget:self action:@selector(rememberPwBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgImgView addSubview:rememberPwBtn];
    
    //注册按钮
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setFrame:CGRectMake(0, kScreenHeight -100 -64, kScreenWidth/2, 50)];
    [registerBtn setBackgroundColor:[UIColor whiteColor]];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgImgView addSubview:registerBtn];
    
    lineView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth/2-1, kScreenHeight -100 -64 +5, 1, 40)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [bgImgView addSubview:lineView];
    
    //登录
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:CGRectMake(kScreenWidth/2, kScreenHeight -100 -64, kScreenWidth/2, 50)];
    [loginBtn setBackgroundColor:[UIColor whiteColor]];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgImgView addSubview:loginBtn];
    
    //找回密码
    UIButton *retrieveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [retrieveBtn setFrame:CGRectMake(0, 0, 0, 0)];
    [retrieveBtn setBackgroundColor:[UIColor whiteColor]];
    [retrieveBtn setTitle:@"忘记密码？点此找回" forState:UIControlStateNormal];
    [retrieveBtn setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];
    [retrieveBtn addTarget:self action:@selector(retrieveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgImgView addSubview:retrieveBtn];
}

//记住密码
- (void)rememberPwBtnClick
{
    NSLog(@"记住密码按钮");
}

//注册 按钮
- (void)registerBtnClick
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [registerVC setTitle:@"用户注册"];
    [self.navigationController pushViewController:registerVC animated:YES];
}

//登录 按钮
- (void)loginBtnClick
{
    NSLog(@"发送登录 接口");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"phone": nameTextF.text,@"password":pwTextF.text};
    
    [manager POST:@"http://app.gudaochina.com/index.php/Api/Member/memberLogin" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        if ([responseObject[@"code"] integerValue] == 1000) {
            NSLog(@"登录成功,存入单例");
            [ReadWriteSandbox writePropertyFile:responseObject[@"data"][0] FilePath:User_File_Path];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];

}

//记住按钮
- (void)retrieveBtnClick
{
    NSLog(@"找回密码");
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [bgImgView setFrame:CGRectMake(0, -200, bgImgView.frame.size.width, bgImgView.frame.size.height)];
    [UIView commitAnimations];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [bgImgView setFrame:CGRectMake(0, 0, bgImgView.frame.size.width, bgImgView.frame.size.height)];
    [UIView commitAnimations];
    
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [nameTextF resignFirstResponder];
    [pwTextF resignFirstResponder];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [bgImgView setFrame:CGRectMake(0, 0, bgImgView.frame.size.width, bgImgView.frame.size.height)];
    [UIView commitAnimations];
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
