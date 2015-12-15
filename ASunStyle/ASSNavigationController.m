//
//  ASSNavigationController.m
//  ASunStyle
//
//  Created by Marx on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSNavigationController.h"

@interface ASSNavigationController ()

@end

@implementation ASSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.navigationBar.frame.size.width, self.navigationBar.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"navigaitonbar_bg"]];
    [self.navigationBar setBackgroundImage:imageView.image forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:17]};
    
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self.navigationBar setShadowImage:[UIImage imageNamed:@"navigaitonbar_bg_no"]];
    NSLog(@"%f",self.navigationBar.frame.size.height);
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
