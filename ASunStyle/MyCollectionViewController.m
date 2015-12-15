//
//  MyCollectionViewController.m
//  ASunStyle
//
//  Created by soldier on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "MyCollectionViewController.h"

@interface MyCollectionViewController ()

@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setMyCollectionCustomView];

}

- (void)setMyCollectionCustomView
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    [topView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:topView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth/2, 3, 1, 30-6)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [topView addSubview:lineView];
    
    UIButton *zuopinBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 30)];
    [zuopinBtn setTitle:@"作品" forState:UIControlStateNormal];
    [zuopinBtn setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];
    zuopinBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    [zuopinBtn addTarget:self action:@selector(clickSwitchoverBtn:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:zuopinBtn];
    
    UIButton *meifashiBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth/2, 0, kScreenWidth/2, 30)];
    [meifashiBtn setTitle:@"美发师" forState:UIControlStateNormal];
    [meifashiBtn setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];
    meifashiBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    [meifashiBtn addTarget:self action:@selector(clickSwitchoverBtn:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:meifashiBtn];
    
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [topView addSubview:lineView];
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    //            flowLayout.itemSize = CGSizeMake(DEF_SCREEN_WIDTH/4.0-0.5, DEF_SCREEN_WIDTH/4.0);
    flowLayout.itemSize = CGSizeMake(kScreenWidth/2.0-10, 280);
    myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 40, kScreenWidth-10, kScreenHeight-64-40) collectionViewLayout:flowLayout];
    [myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
    [myCollectionView setDelegate:self];
    [myCollectionView setDataSource:self];
    [myCollectionView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:myCollectionView];

}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    cell.layer.borderWidth = 1.0f;
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 10.0f;
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:cell.frame];
    [imgV setFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    [imgV setImage:[UIImage imageNamed:@"personal_head"]];
    [cell addSubview:imgV];
    
    UIView *markView = [[UIView alloc] initWithFrame:CGRectMake(0, 210, cell.frame.size.width, 70)];
    [markView setBackgroundColor:[UIColor clearColor]];
    [markView setBackgroundColor:UIColorFromHex(0xffffff, 0.5)];
    [cell addSubview:markView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 40)];
    [titleLabel setText:@"动态烫B项"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:20.0f]];
    [markView addSubview:titleLabel];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, cell.frame.size.width/2, 30)];
    [priceLabel setText:@"￥168.00"];
    [priceLabel setTextAlignment:NSTextAlignmentCenter];
    [priceLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [markView addSubview:priceLabel];
    
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width/2, 40, cell.frame.size.width/2, 30)];
    [numLabel setText:@"286人做过"];
    [numLabel setTextAlignment:NSTextAlignmentCenter];
    [numLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [markView addSubview:numLabel];
    
    //    cell.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    //    cell.layer.borderWidth = DEF_ONE_PIXEL/4;
    
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(cell.frame)-DEF_ONE_PIXEL, CGRectGetWidth(cell.frame), DEF_ONE_PIXEL)];
//    [lineView setBackgroundColor:[UIColor lightGrayColor]];
//    [cell addSubview:lineView];
//    
//    lineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth(cell.frame)-DEF_ONE_PIXEL, 0,DEF_ONE_PIXEL, CGRectGetHeight(cell.frame))];
//    [lineView setBackgroundColor:[UIColor lightGrayColor]];
//    [cell addSubview:lineView];
//    
//    NSLog(@"%.2f",CGRectGetHeight(cell.frame));
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(DEF_SCREEN_WIDTH/16, (CGRectGetHeight(cell.frame)-DEF_SCREEN_WIDTH/8)/2, DEF_SCREEN_WIDTH/8, DEF_SCREEN_WIDTH/8)];
//    if (indexPath.row <9 ) {
//        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_category_00%ld",indexPath.row+1]]];
//    }else
//    {
//        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_category_0%ld",indexPath.row+1]]];
//    }
//    [cell addSubview:imageView];
    
    //    // cell点击变色
    //    UIView* selectedBGView = [[UIView alloc] initWithFrame:cell.bounds];
    //    selectedBGView.backgroundColor = [UIColor redColor];
    //
    //    UIImageView *checkImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    //    [checkImgView setImage:[UIImage imageNamed:@""]];
    //    [selectedBGView addSubview:checkImgView];
    //
    //    cell.selectedBackgroundView = selectedBGView;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

// cell点击变色
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark  -- 作品、美发师 切换
- (void)clickSwitchoverBtn:(id)sender
{
    NSLog(@"美发师、作品收藏切换");
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
