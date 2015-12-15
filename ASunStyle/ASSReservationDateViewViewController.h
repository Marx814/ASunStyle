//
//  ASSReservationDateViewViewController.h
//  ASunStyle
//
//  Created by Marx on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"
#import "LGCalendar.h"
#import "UIImage+Color.h"

@interface ASSReservationDateViewViewController : ASSBaseViewController<LGCalendarDelegate>

@property(nonatomic)LGCalendar *calender;
@property(nonatomic)UIView *timeView;
@property(nonatomic)UIView *timeButtonView;
@property(nonatomic)UIButton *selectedTimeButton;
@property(nonatomic)UIButton *confirmButton;

@end
