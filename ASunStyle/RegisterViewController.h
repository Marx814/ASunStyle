//
//  RegisterViewController.h
//  ASunStyle
//
//  Created by soldier on 15/12/7.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"
#import "AFNetworking.h"

@interface RegisterViewController : ASSBaseViewController <UITextFieldDelegate>
{
    UITextField *phoneTextF;                    //电话号
    UITextField *verifyCodeTextF;               //验证码
    UITextField *passwordTextF;                 //密码
    UITextField *confirmPwTextF;                //确认密码
}

@end
