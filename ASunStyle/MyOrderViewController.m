//
//  MyOrderViewController.m
//  ASunStyle
//
//  Created by soldier on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "MyOrderViewController.h"

@interface MyOrderViewController ()

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setMyOrderCustomView];
}

- (void)setMyOrderCustomView
{
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 75)];
    [tableHeaderView setBackgroundColor:[UIColor whiteColor]];
    
    //title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 6, 60, 13)];
    [titleLabel setText:@"我的订单"];
    [titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [titleLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [tableHeaderView addSubview:titleLabel];
    
    //查看全部订单按钮
    UIButton *allOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [allOrderBtn setFrame:CGRectMake(kScreenWidth-100, 0, 85, 25)];
    [allOrderBtn setTag:100];
    [allOrderBtn addTarget:self action:@selector(clickOrderBtn:) forControlEvents:UIControlEventTouchUpInside];
    [tableHeaderView addSubview:allOrderBtn];
    
    //按钮 title
    UILabel *btnTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 7, 70, 12)];
    [btnTitleLab setText:@"查看全部订单"];
    [btnTitleLab setTag:300];
    [btnTitleLab setFont:[UIFont boldSystemFontOfSize:11.0f]];
    [btnTitleLab setTextColor:[UIColor blackColor]];
    [allOrderBtn addSubview:btnTitleLab];
    
    //按钮 图片
    UIImageView *arrowImgV = [[UIImageView alloc] initWithFrame:CGRectMake(70, 5, 10, 15)];
    [arrowImgV setImage:[UIImage imageNamed:@"order_arrow"]];
    [arrowImgV setTag:200];
    [allOrderBtn addSubview:arrowImgV];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 24.5, kScreenWidth, 0.5)];
    [lineView setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
    [tableHeaderView addSubview:lineView];
    
    NSArray *titleArray = @[@"未付款",@"未消费",@"未评价",@"取消订单"];
    NSArray *imgArray  = @[@"order_nopaymentNor",@"order_noexpenseNor",@"order_nocommentNor",@"order_cancelorderNor"];
    for (int i = 0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(i*kScreenWidth/4, 25, kScreenWidth/4, 50)];
        [button setTag:(101+i)];
        [button addTarget:self action:@selector(clickOrderBtn:) forControlEvents:UIControlEventTouchUpInside];
        [tableHeaderView addSubview:button];
        
        UIImageView *btnImgV = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth/4-25)/2, 10, 25, 20)];
        [btnImgV setTag:(button.tag +100)];
        [btnImgV setImage:[UIImage imageNamed:imgArray[i]]];
        [button addSubview:btnImgV];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth/4-45)/2, 35, 45, 11)];
        [titleLabel setText:titleArray[i]];
        [titleLabel setTag:(button.tag +200)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setFont:[UIFont systemFontOfSize:11]];
        [button addSubview:titleLabel];
    }
    
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 74, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [tableHeaderView addSubview:lineView];

    
    UITableView *orderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    [orderTableView setBackgroundColor:[UIColor clearColor]];
    [orderTableView setDelegate:self];
    [orderTableView setDataSource:self];
    [orderTableView setTableHeaderView:tableHeaderView];
    [orderTableView setTableFooterView:[UIView new]];
    [self.view addSubview:orderTableView];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[OrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.headImgV setImage:[UIImage imageNamed:@"personal_head"]];
    [cell.orderTitle setText:@"动感烫A项"];
    [cell.orderDate setText:@"预约时间：2015.10.15 14:30"];
    [cell.orderPrice setText:@"价格：198.00元"];
    [cell.orderHairdresser setText:@"美发师：班森"];
    [cell.orderStateBtn setTitle:@"未预约" forState:UIControlStateNormal];

    
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  85;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击 cell …………");
    OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc] init];
    [orderDetailVC setTitle:@"我的订单"];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}

#pragma mark -- 
- (void)clickOrderBtn:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    NSArray *imgArray  = @[@"order_arrow",@"order_nopaymentNor",@"order_noexpenseNor",@"order_nocommentNor",@"order_cancelorderNor"];
    for (int i = 0; i<5; i++) {
        UIImageView *imgView = (UIImageView *)[self.view viewWithTag:(i+200)];
        [imgView setImage:[UIImage imageNamed:imgArray[i]]];
        
        UILabel *label = (UILabel *)[self.view viewWithTag:(i+300)];
        [label setTextColor:[UIColor blackColor]];
    }
    
    NSArray *imgSelArray  = @[@"order_arrow",@"order_nopaymentSel",@"order_noexpenseSel",@"order_nocommentSel",@"order_cancelorderSel"];
    
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:(btn.tag+100)];
    [imgView setImage:[UIImage imageNamed:imgSelArray[btn.tag-100]]];

    UILabel *label = (UILabel *)[self.view viewWithTag:(btn.tag+200)];
    [label setTextColor:UIColorFromHex(0xf421ae, 1)];
    
    switch (btn.tag) {
        case 100:
            NSLog(@"查看所有订单");
            break;
        case 101:
            NSLog(@"查看未支付订单");
            
            break;
        case 102:
            NSLog(@"查看未消费订单");

            break;
        case 103:
            NSLog(@"查看未评价订单");

            break;
        case 104:
            NSLog(@"查看取消订单");

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
