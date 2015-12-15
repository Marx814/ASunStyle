//
//  ModifyLoginPwViewController.h
//  ASunStyle
//
//  Created by soldier on 15/11/8.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"

@interface ModifyLoginPwViewController : ASSBaseViewController <UITextFieldDelegate>
{
    UITextField *oldPassWTextF;
    UITextField *newPassWTextF;
    UITextField *confirmPassWTextF;
}

@end
