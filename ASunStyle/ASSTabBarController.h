//
//  ASSTabBarController.h
//  ASunStyle
//
//  Created by Marx on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASSHomeViewController.h"
#import "ASSReservationViewController.h"
#import "ASSPersonalViewController.h"
#import "ASSMoreViewController.h"

@interface ASSTabBarController : UITabBarController<UITabBarControllerDelegate>

+ (ASSTabBarController *)shareTabBarController;

@property(nonatomic)ASSHomeViewController *homeViewController;
@property(nonatomic)ASSReservationViewController *reservationViewController;
@property(nonatomic)ASSPersonalViewController *personalViewController;
@property(nonatomic)ASSMoreViewController *moreViewController;

@end
