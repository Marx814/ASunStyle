//
//  ASSHairdresserListViewController.m
//  ASunStyle
//
//  Created by soldier on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSHairdresserListViewController.h"

@implementation ASSHairdresserListViewController

- (UITableView *)hairdresTableView
{
    if (!_hairdresTableView) {
        _hairdresTableView = ({
            UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight-64-50) style:UITableViewStylePlain];
            [tableView setBackgroundColor:[UIColor clearColor]];
            [tableView setDataSource:self];
            [tableView setDelegate:self];
            [tableView setShowsVerticalScrollIndicator:NO];
            [tableView setTableFooterView:[UIView new]];
            tableView;
        });
    }
    return _hairdresTableView;
}

- (UIView *)topView
{
    if (!_topView) {
        _topView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
            [view setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
            
            NSArray *titleArray = @[@"综合排名",@"人气排名",@"新人排名"];
            for (int i = 0; i<3; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setFrame:CGRectMake(i*kScreenWidth/3, 0, kScreenWidth/3, 50)];
                [button setTag:(100+i)];
                [button setTitle:titleArray[i] forState:UIControlStateNormal];
                [button.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button addTarget: self action:@selector(clickRankingWayBtn:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:button];
            }
            //分隔线
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, kScreenWidth, 1)];
            [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
            [view addSubview:lineView];
            
            view;
        });
    }
    return _topView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);

    _hairdressListArray = [NSMutableArray array];
    
    [self requestHairdressListData:@"start_level_desc"];
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.hairdresTableView];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _hairdressListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    HairdresListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[HairdresListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.headImgV setImageWithURL:[NSURL URLWithString:_hairdressListArray[indexPath.row][@"hair_banner"]] placeholderImage:[UIImage imageNamed:@"personal_head"]];
    [cell.nameLabel setText:_hairdressListArray[indexPath.row][@"hairdresser_name"]];
    cell.starRateView.scorePercent = [_hairdressListArray[indexPath.row][@"start_level"] intValue]/5;

    [cell.numLabel setText:[NSString stringWithFormat:@"接单数：%@",_hairdressListArray[indexPath.row][@"id"]]];
    return cell;

}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击cell");
    ASSHairdressViewController *hairdressVC = [[ASSHairdressViewController alloc] init];
    hairdressVC.hairdressId = _hairdressListArray[indexPath.row][@"id"];
    [self.navigationController pushViewController:hairdressVC animated:YES];
}

#pragma mark - 排名方式按钮
- (void)clickRankingWayBtn:(UIButton *)sender
{
    for (int i=0 ;i<3; i++) {
        UIButton *btn = (UIButton *)[self.view viewWithTag:(100+i)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [sender setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];

    switch (sender.tag) {
        case 100:
        {
            NSLog(@"按综合排名 理发师列表 ");
            if ([_zongheType isEqualToString:@"start_level_desc"]) {
                _zongheType = @"start_level_asc";
            }else
            {
                _zongheType = @"start_level_desc";
            }
            [self requestHairdressListData:_zongheType];
        }
            break;
        case 101:
            NSLog(@"按人气排名 理发师列表 ");
            if ([_renqiType isEqualToString:@"order_num_desc"]) {
                _renqiType = @"order_num_asc";
            }else
            {
                _renqiType = @"order_num_desc";
            }
            [self requestHairdressListData:_renqiType];
            break;
        case 102:
            NSLog(@"按新人排名 理发师列表 ");
            if ([_xinrenType isEqualToString:@"id_desc"]) {
                _xinrenType = @"id_asc";
            }else
            {
                _xinrenType = @"id_desc";
            }
            [self requestHairdressListData:_xinrenType];
            break;
            
        default:
            break;
    }
}

#pragma mark RequestData
- (void)requestHairdressListData:(NSString *)orderType
{
    NSDictionary *hairdressDic = @{@"order":orderType};
    [ASSNetWoringHttpRequestManager requestInterfaceWithParameters:hairdressDic andURL:ASSHairdresserListUrl andBlock:^(ASSHttpState state, NSDictionary *responseDictionary) {
        if (state == ASSHttpStateOK) {
            _hairdressListArray = responseDictionary[@"data"];
            [_hairdresTableView reloadData];
        }
    }];
}

@end
