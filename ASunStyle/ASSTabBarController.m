//
//  ASSTabBarController.m
//  ASunStyle
//
//  Created by Marx on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSTabBarController.h"

@interface ASSTabBarController ()

@end

@implementation ASSTabBarController

+ (ASSTabBarController *)shareTabBarController
{
    static ASSTabBarController *_tabBarConteroller = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _tabBarConteroller = [[ASSTabBarController alloc] init];
    });
    return _tabBarConteroller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"做头网"];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    [backItem setTitle:@""];
    self.navigationItem.backBarButtonItem =backItem;
    [self customView];
}

#pragma mark CustomView
- (void)customView
{
    _homeViewController = [ASSHomeViewController new];
    _reservationViewController = [ASSReservationViewController new];
    _personalViewController = [ASSPersonalViewController new];
    _moreViewController = [ASSMoreViewController new];
    
    self.delegate = self;
    
    self.viewControllers = [NSArray arrayWithObjects:_homeViewController, _reservationViewController, _personalViewController , _moreViewController, nil];
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    
    [self.tabBar setTranslucent:NO];
    [self.tabBar setShadowImage:[[UIImage alloc]init]];
    [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromHex(0x19082a, 1)} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: UIColorFromHex(0xf0009a, 1)} forState:UIControlStateSelected];
    
    NSArray *tabbarNormalImageArray = @[@"tabbar_home_normal",@"tabbar_reservation_normal",@"tabbar_personal_normal",@"tabbar_more_normal"];
    NSArray *tabbarSelectedImageArray = @[@"tabbar_home_selected",@"tabbar_reservation_selected",@"tabbar_personal_selected",@"tabbar_more_selected"];
    NSArray *tabbarTitleArray = @[@"首页",@"预约",@"我的",@"更多"];
    for (int i =0; i<4; i++) {
        UITabBarItem *item = self.tabBar.items[i];
        [item setImage:[[UIImage imageNamed:tabbarNormalImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setSelectedImage:[[UIImage imageNamed:tabbarSelectedImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item setTitle:tabbarTitleArray[i]];
        [item setTag:100+i];
    }
}

#pragma mark TabBarController Delegate

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self setTitle:item.title];
    NSLog(@"%ld",(long)item.tag);
    switch (item.tag) {
        case 100:
            [self setTitle:@"做头网"];
            break;
        case 101:
            [self setTitle:@"预约"];
            break;
        case 102:
            [self setTitle:@"我的"];
            break;
        case 103:
            [self setTitle:@"更多"];

            break;
            
        default:
            break;
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
