//
//  ASSReservationDateViewViewController.m
//  ASunStyle
//
//  Created by Marx on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSReservationDateViewViewController.h"

@implementation ASSReservationDateViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:UIColorFromHex(0xfed7ed, 1)];
    [self setTitle:@"预约时间"];
    [self customView];
    self.refresh = YES;
}

#pragma mark CustomView
- (void)customView
{
    [self.view addSubview:self.calender];
    [self.view addSubview:self.timeView];
    [self.view addSubview:self.timeButtonView];
    [self.view addSubview:self.confirmButton];
}

- (LGCalendar *)calender
{
    if (!_calender) {
        _calender = ({
            LGCalendar *calendar = [[LGCalendar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 240)];
            [calendar setDelegate:self];
            calendar;
        });
    }
    return _calender;
}
- (UIView *)timeView
{
    if (!_timeView) {
        _timeView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 240, kScreenWidth, 40)];
            [view setBackgroundColor:[UIColor whiteColor]];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
            [label setBackgroundColor:[UIColor clearColor]];
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setTextColor:UIColorFromHex(0xee008d, 1)];
            [label setFont:[UIFont systemFontOfSize:16]];
            [label setText:@"预约时间"];
            [view addSubview:label];
            view;
        });
    }
    return _timeView;
}

- (UIView *)timeButtonView
{
    if (!_timeButtonView) {
        _timeButtonView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 280, kScreenWidth, 90)];
            [view setBackgroundColor:[UIColor clearColor]];
            
            for (int i = 0; i<12; i++) {
                NSInteger r = i/6;
                NSInteger c = i%6;
                
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setFrame:CGRectMake(30 + (kScreenWidth-60)/6*c, 10 +45*r, (kScreenWidth-60)/6, 35)];
                [button.layer setMasksToBounds:YES];
                [button.layer setBorderColor:UIColorFromHex(0xf00093, 1).CGColor];
                [button.layer setBorderWidth:0.5];
                [button setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xfed7ed, 1) size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
                [button setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xf00093, 1) size:CGSizeMake(1, 1)] forState:UIControlStateSelected];
                [button setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xf00093, 1) size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
                [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
                [button setTitle:[NSString stringWithFormat:@"%d:00",10+i] forState:UIControlStateNormal];
                
                if (i == 0) {
                    [button setSelected:YES];
                    _selectedTimeButton = button;
                }
                
                [view addSubview:button];
            }
            
            
            view;
        });
    }
    return _timeButtonView;
}

- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(30, kScreenHeight - kNavigationBarHight - 80, kScreenWidth-60, 40)];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:2.5];
            [button setBackgroundImage:[UIImage imageWithColor:UIColorFromHex(0xee008d, 1)  size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
            [button setTitle:@"确定" forState:UIControlStateNormal];
            button;
        });
    }
    return _confirmButton;
}

#pragma mark LGCalendarDelegate
-(void)LGCalendar:(LGCalendar *)calendar didSelectDate:(NSDate *)selectDate
{
    NSLog(@"select date:%@", selectDate);
//    [self.textField setText:[NSString stringWithFormat:@"%@", selectDate]];
}


@end
