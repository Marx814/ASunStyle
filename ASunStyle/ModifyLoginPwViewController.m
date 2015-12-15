//
//  ModifyLoginPwViewController.m
//  ASunStyle
//
//  Created by soldier on 15/11/8.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ModifyLoginPwViewController.h"

@interface ModifyLoginPwViewController ()

@end

@implementation ModifyLoginPwViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setModifyLoginPwCustomView];

}

- (void)setModifyLoginPwCustomView
{
    UILabel *oldPassWLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 80, 30)];
    [oldPassWLabel setText:@"当前密码："];
    [oldPassWLabel setTextAlignment:NSTextAlignmentRight];
    [oldPassWLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [oldPassWLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [self.view addSubview:oldPassWLabel];
    
    oldPassWTextF = [[UITextField alloc] initWithFrame:CGRectMake(80, 23, kScreenWidth-100, 25)];
    oldPassWTextF.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    oldPassWTextF.layer.borderWidth = 1.0;
    [oldPassWTextF setBackgroundColor:[UIColor whiteColor]];
    [oldPassWTextF setFont:[UIFont systemFontOfSize:12.0]];
    [oldPassWTextF setAutocorrectionType:UITextAutocorrectionTypeNo];
    [oldPassWTextF setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [oldPassWTextF setReturnKeyType:UIReturnKeyDone];
    [oldPassWTextF setClearButtonMode:UITextFieldViewModeWhileEditing];
    [oldPassWTextF setKeyboardType:UIKeyboardTypeDefault];
    [oldPassWTextF setDelegate:self];
//    [oldPassWTextF setPlaceholder:@"请输入当前密码"];
    [self.view addSubview:oldPassWTextF];
    
    UILabel *newPassWLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 80, 30)];
    [newPassWLabel setText:@"新密码："];
    [newPassWLabel setTextAlignment:NSTextAlignmentRight];
    [newPassWLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [newPassWLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [self.view addSubview:newPassWLabel];
    
    newPassWTextF = [[UITextField alloc] initWithFrame:CGRectMake(80, 53, kScreenWidth-100, 25)];
    newPassWTextF.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    newPassWTextF.layer.borderWidth = 1.0;
    [newPassWTextF setBackgroundColor:[UIColor whiteColor]];
    [newPassWTextF setFont:[UIFont systemFontOfSize:12.0]];
    [newPassWTextF setAutocorrectionType:UITextAutocorrectionTypeNo];
    [newPassWTextF setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [newPassWTextF setReturnKeyType:UIReturnKeyDone];
    [newPassWTextF setClearButtonMode:UITextFieldViewModeWhileEditing];
    [newPassWTextF setKeyboardType:UIKeyboardTypeDefault];
    [newPassWTextF setDelegate:self];
//    [newPassWTextF setPlaceholder:@"请输入新密码"];
    [self.view addSubview:newPassWTextF];
    
    UILabel *confirmPassWLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 80, 30)];
    [confirmPassWLabel setText:@"确认新密码："];
    [confirmPassWLabel setTextAlignment:NSTextAlignmentRight];
    [confirmPassWLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [confirmPassWLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [self.view addSubview:confirmPassWLabel];
    
    confirmPassWTextF = [[UITextField alloc] initWithFrame:CGRectMake(80, 83, kScreenWidth-100, 25)];
    confirmPassWTextF.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    confirmPassWTextF.layer.borderWidth = 1.0;
    [confirmPassWTextF setBackgroundColor:[UIColor whiteColor]];
    [confirmPassWTextF setFont:[UIFont systemFontOfSize:12.0]];
    [confirmPassWTextF setAutocorrectionType:UITextAutocorrectionTypeNo];
    [confirmPassWTextF setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [confirmPassWTextF setReturnKeyType:UIReturnKeyDone];
    [confirmPassWTextF setClearButtonMode:UITextFieldViewModeWhileEditing];
    [confirmPassWTextF setKeyboardType:UIKeyboardTypeDefault];
    [confirmPassWTextF setDelegate:self];
//    [confirmPassWTextF setPlaceholder:@"确认新密码"];
    [self.view addSubview:confirmPassWTextF];
    
    UILabel *annotationLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 110, kScreenWidth-100, 25)];
    [annotationLabel setText:@"注：密码长度至少少于6个字符，最多32个字符"];
    [annotationLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [self.view addSubview:annotationLabel];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setFrame:CGRectMake((kScreenWidth-170)/2, 175, 170, 40)];
    [confirmBtn setImage:[UIImage imageNamed:@"modifyLoginPw_confirm"] forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmModifyLoginPasswordBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmBtn];
}

- (void)confirmModifyLoginPasswordBtn
{
    NSLog(@"确定修改登录密码");
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
