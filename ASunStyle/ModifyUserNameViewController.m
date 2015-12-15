//
//  ModifyUserNameViewController.m
//  ASunStyle
//
//  Created by soldier on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ModifyUserNameViewController.h"

@interface ModifyUserNameViewController ()
{
    UITextField *uNameTextF;
}

@end

@implementation ModifyUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setModifyUserNameCustomView];

}

- (void)setModifyUserNameCustomView
{
    UIView *uNameBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 15, kScreenWidth, 40)];
    [uNameBgView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:uNameBgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 12, 60, 15)];
    [titleLabel setText:@"用户名:"];
    [titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [uNameBgView addSubview:titleLabel];
    
    uNameTextF = [[UITextField alloc] initWithFrame:CGRectMake(90, 10, kScreenWidth-120, 20)];
    [uNameTextF setDelegate:self];
    [uNameTextF setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
    uNameTextF.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    uNameTextF.layer.borderWidth = 1.0f;
    uNameTextF.layer.cornerRadius = 2.0f;
    uNameTextF.layer.masksToBounds = YES;
    [uNameBgView addSubview:uNameTextF];
    
    //注释
    UILabel *reminderLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, kScreenWidth-40, 30)];
    [reminderLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [reminderLabel setNumberOfLines:0];
    [reminderLabel setText:@"注：以中文或英文字母开头，限4-16个字符，一个汉字为两个字符。"];
    [reminderLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [reminderLabel setFont:[UIFont systemFontOfSize:11.0f]];
    [self.view addSubview:reminderLabel];
    
    //华丽的分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-64-62, kScreenWidth, 2)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    UIView *confirmBgView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-64-60, kScreenWidth, 60)];
    [confirmBgView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:confirmBgView];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setFrame:CGRectMake(60, 20, kScreenWidth-120, 20)];
    [confirmBtn setBackgroundImage:[UIImage imageNamed:@"personcenter_confirm"] forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(clickConfirmUserNameBtn:) forControlEvents:UIControlEventTouchUpInside];
    [confirmBgView addSubview:confirmBtn];
}


#pragma mark -- 用户名修改 确定按钮
- (void)clickConfirmUserNameBtn:(id)sender
{
    NSLog(@"用户名修改 ，确定…………");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"truename": uNameTextF.text,@"token":[ASSUserModel shareUserModel].token};
    
    [manager POST:@"http://app.gudaochina.com/index.php/Api/Member/editTrueName" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        if ([responseObject[@"code"] integerValue] == 1000) {
            NSLog(@"修改用户名成功");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"修改用户名成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];

}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [uNameTextF resignFirstResponder];
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
