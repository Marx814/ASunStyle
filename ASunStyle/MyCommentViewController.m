//
//  MyCommentViewController.m
//  ASunStyle
//
//  Created by soldier on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "MyCommentViewController.h"

@interface MyCommentViewController ()

@end

@implementation MyCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setMyCommentCustomView];

}

- (void)setMyCommentCustomView
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth, 120)];
    [topView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:topView];
    
    UIImageView *headImgV = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-50)/2, 20, 50, 50)];
    [headImgV setImage:[UIImage imageNamed:@"personal_head"]];
    headImgV.layer.masksToBounds = YES;
    headImgV.layer.cornerRadius = 25.0f;
    [topView addSubview:headImgV];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, kScreenWidth , 20)];
    [nameLabel setText:@"高圆圆"];
    [nameLabel setTextAlignment:NSTextAlignmentCenter];
    [nameLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [nameLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
    [topView addSubview:nameLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 130, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    UITableView *commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 140, kScreenWidth, kScreenHeight - 64 - 140) style:UITableViewStylePlain];
    [commentTableView setBackgroundColor:[UIColor clearColor]];
    [commentTableView setDelegate:self];
    [commentTableView setDataSource:self];
    [commentTableView setShowsVerticalScrollIndicator:NO];
    commentTableView.translatesAutoresizingMaskIntoConstraints = NO;
//    [commentTableView setTableHeaderView:tableHeaderView];
    [commentTableView setTableFooterView:[UIView new]];
    [self.view addSubview:commentTableView];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.headImgV setImage:[UIImage imageNamed:@"personal_head"]];
    [cell.commentTitle setText:@"动感烫A项"];
    [cell.commentHairdresser setText:@"美发师：班森"];
    [cell.commentContent setText:@"美发师：班森"];
    
    
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  125;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击 评价 cell …………");
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
