//
//  ShipAddressViewController.m
//  ASunStyle
//
//  Created by soldier on 15/10/27.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ShipAddressViewController.h"

@interface ShipAddressViewController ()

@end

@implementation ShipAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setShipAddressCustomView];

}

- (void)setShipAddressCustomView
{
    UITableView *shipAddTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 -62) style:UITableViewStylePlain];
    [shipAddTableV setDelegate:self];
    [shipAddTableV setDataSource:self];
    [shipAddTableV setBackgroundColor:[UIColor clearColor]];
    [shipAddTableV setTableFooterView:[UIView new]];
    [shipAddTableV setSeparatorStyle:UITableViewCellSeparatorStyleNone]; 
    [self.view addSubview:shipAddTableV];
    
    //华丽的分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(shipAddTableV.frame), kScreenWidth, 2)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    UIView *newConsigneeInfoBgView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-64-60, kScreenWidth, 60)];
    [newConsigneeInfoBgView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:newConsigneeInfoBgView];
    
    UIButton *newConsigneeInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [newConsigneeInfoBtn setFrame:CGRectMake(60, 20, kScreenWidth-120, 20)];
    [newConsigneeInfoBtn setBackgroundImage:[UIImage imageNamed:@"personcenter_confirm"] forState:UIControlStateNormal];
    [newConsigneeInfoBtn addTarget:self action:@selector(clickNewConsigneeInfoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [newConsigneeInfoBgView addSubview:newConsigneeInfoBtn];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    AddressCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[AddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.uNameLabel setText:@"用户名：高圆圆"];
    [cell.phoneLabel setText:@"电话：13700000000"];
    [cell.cityLabel setText:@"省市：辽宁省沈阳市沈河区"];
    [cell.addressLabel setText:@"地址：正阳街116号楼上51号"];
    [cell.codeLabel setText:@"邮编：110000"];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:
(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [projectArray removeObjectAtIndex:indexPath.row];
//        // Delete the row from the data source.
//        [_projectTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  125;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击 cell …………");
}


#pragma mark -- 新建收货人信息
- (void)clickNewConsigneeInfoBtn:(id)sender
{
    NSLog(@"新建收货人信息");
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
