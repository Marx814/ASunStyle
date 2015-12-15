//
//  ASSHairdressViewController.m
//  ASunStyle
//
//  Created by soldier on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSHairdressViewController.h"

@implementation ASSHairdressViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColorFromHex(0xfde0f0, 1)];
    
    _worksArray = [NSMutableArray array];
    [self requestHairdresserInfoData];
    
    [self.view addSubview:self.headImgView];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.numberLabel];
    [self.view addSubview:self.starRateView];
    [self.view addSubview:self.middleView];
    [self.view addSubview:self.worksCollectionView];
    
}

- (UIImageView *)headImgView
{
    if (!_headImgView) {
        _headImgView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 60, 60)];
            [imageView.layer setMasksToBounds:YES];
            imageView.layer.cornerRadius = 30.0f;
            [imageView setImage:[UIImage imageNamed:@"personal_head"]];
            imageView;
        });
    }
    return _headImgView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, kScreenWidth-100, 20)];
            [label setText:@"小磊"];
            [label setTextColor:UIColorFromHex(0xf421ae, 1)];
            [label setFont:[UIFont boldSystemFontOfSize:13.0f]];
            label;
        });
    }
    return _nameLabel;
}

- (CWStarRateView *)starRateView
{
    if (!_starRateView) {
        _starRateView = ({
            CWStarRateView *cwStarView = [[CWStarRateView alloc] initWithFrame:CGRectMake(100, 50, 100, 15) numberOfStars:5];
            cwStarView.allowIncompleteStar = YES;
            cwStarView.hasAnimation = NO;
            cwStarView.changeStartPercent = NO;
            cwStarView;
        });
    }
    return _starRateView;
}

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, kScreenWidth-100, 20)];
            [label setText:@"接单数：142"];
            [label setTextColor:UIColorFromHex(0xf421ae, 1)];
            [label setFont:[UIFont boldSystemFontOfSize:13.0f]];
            label;
        });
    }
    return _numberLabel;
}

- (UIView *)middleView
{
    if (!_middleView) {
        _middleView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 120, kScreenWidth, 120)];
            [view setBackgroundColor:[UIColor whiteColor]];
            
            for (int i = 0; i<4; i++) {
                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, i*40-1, kScreenWidth, 1)];
                [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
                [view addSubview:lineView];
            }
            
            [view addSubview:self.professionalLabel];
            [view addSubview:self.communicateLabel];
            
            //顾客评价
            UIButton *evaluateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [evaluateBtn setFrame:CGRectMake(0, 40, kScreenWidth , 40)];
            [evaluateBtn setBackgroundColor:[UIColor clearColor]];
            [evaluateBtn addTarget:self action:@selector(clickEvaluateBtn:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:evaluateBtn];
            [view addSubview:self.evaluateLabel];
            UIImageView *arrowImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-50, 50, 15, 20)];
            [arrowImgV setImage:[UIImage imageNamed:@"order_arrow"]];
            [view addSubview:arrowImgV];
            
            NSArray *titleArray = @[@"Ta的作品",@"Ta的介绍"];
            for (int i = 0; i<2; i++) {
                UIButton *worksBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                [worksBtn setFrame:CGRectMake(kScreenWidth/2*i, 80, kScreenWidth/2 , 40)];
                [worksBtn setTitle:titleArray[i] forState:UIControlStateNormal];
                [worksBtn setTag:(100+i)];
                [worksBtn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
                [worksBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                if (i == 0) {
                    [worksBtn setFrame:CGRectMake(30, 80, kScreenWidth/2 , 40)];
                    worksBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                    [worksBtn setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];
                }
                [worksBtn addTarget:self action:@selector(clickWorksOrIntroduceBtn:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:worksBtn];
            }
            
            view;
        });
    }
    return _middleView;
}

- (UILabel *)professionalLabel
{
    if (!_professionalLabel) {
        _professionalLabel = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, kScreenWidth/2-30, 40)];
            [label setText:@"沟通：142"];
            [label setTextColor:UIColorFromHex(0xf421ae, 1)];
            [label setTextAlignment:NSTextAlignmentLeft];
            [label setFont:[UIFont boldSystemFontOfSize:13.0f]];
            label;
        });
    }
    return _professionalLabel;
}

- (UILabel *)communicateLabel
{
    if (!_communicateLabel) {
        _communicateLabel = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2, 0, kScreenWidth/2, 40)];
            [label setText:@"专业：142"];
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setTextColor:UIColorFromHex(0xf421ae, 1)];
            [label setFont:[UIFont boldSystemFontOfSize:13.0f]];
            label;
        });
    }
    return _communicateLabel;
}

- (UILabel *)evaluateLabel
{
    if (!_evaluateLabel) {
        _evaluateLabel = ({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, kScreenWidth/2-30, 40)];
            [label setText:@"用户评价（142）"];
//            [label setTextColor:UIColorFromHex(0xf421ae, 1)];
            [label setTextAlignment:NSTextAlignmentLeft];
            [label setFont:[UIFont boldSystemFontOfSize:13.0f]];
            label;
        });
    }
    return _evaluateLabel;
}

- (UIView *)personalInfoView
{
    if (!_personalInfoView) {
        _personalInfoView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            
            view;
        });
    }
    return _personalInfoView;
}

- (UICollectionView *)worksCollectionView
{
    if (!_worksCollectionView) {
        _worksCollectionView = ({
            UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
            flowLayout.minimumLineSpacing = 5;
            flowLayout.minimumInteritemSpacing = 5;
            flowLayout.itemSize = CGSizeMake(kScreenWidth/2.0-10, 280);
            UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 245, kScreenWidth-10, kScreenHeight-64-240) collectionViewLayout:flowLayout];
            [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
            [collectionView setDelegate:self];
            [collectionView setDataSource:self];
            [collectionView setShowsVerticalScrollIndicator:NO];
            [collectionView setBackgroundColor:[UIColor clearColor]];
            collectionView;

        });
    }
    return _worksCollectionView;
}

#pragma mark - 用户评价
- (void)clickEvaluateBtn:(id)sender
{
    NSLog(@"用户评价 界面");
}

#pragma mark - 个人作品或介绍
- (void)clickWorksOrIntroduceBtn:(UIButton *)sender
{
    NSLog(@"个人作品");
    for (int i = 0; i<2; i++) {
        UIButton *btn = [(UIButton *)self.view viewWithTag:(100+i)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [sender setTitleColor:UIColorFromHex(0xf421ae, 1) forState:UIControlStateNormal];
    switch (sender.tag) {
        case 100:
            NSLog(@"个人作品");
            if (_isWorkRequest) {
                [_worksCollectionView setHidden:NO];
                [_personalInfoView setHidden:YES];
            }
            break;
        case 101:
            NSLog(@"个人介绍");
            if (_isPersonalInfoRequest) {
                [_worksCollectionView setHidden:YES];
                [_personalInfoView setHidden:NO];
            }else
            {
                [self requestHairdresserInfo1Data];
            }

            break;
            
        default:
            break;
    }

}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _worksArray.count;
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
    [imgV setImageWithURL:[NSURL URLWithString:_worksArray[indexPath.row][@"project_banner"]] placeholderImage:[UIImage imageNamed:@"personal_head"]];
    [cell addSubview:imgV];
    
    UIView *markView = [[UIView alloc] initWithFrame:CGRectMake(0, 210, cell.frame.size.width, 70)];
    [markView setBackgroundColor:[UIColor clearColor]];
    [markView setBackgroundColor:UIColorFromHex(0xffffff, 0.5)];
    [cell addSubview:markView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 40)];
    [titleLabel setText:_worksArray[indexPath.row][@"project_name"]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:20.0f]];
    [markView addSubview:titleLabel];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, cell.frame.size.width/2, 30)];
    [priceLabel setText:[NSString stringWithFormat:@"￥%@",_worksArray[indexPath.row][@"project_price"]]];
    [priceLabel setTextAlignment:NSTextAlignmentCenter];
    [priceLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [markView addSubview:priceLabel];
    
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width/2, 40, cell.frame.size.width/2, 30)];
//    [numLabel setText:@"286人做过"];
    [numLabel setText:[NSString stringWithFormat:@"%@人做过",_worksArray[indexPath.row][@"sales_volume"]]];
    [numLabel setTextAlignment:NSTextAlignmentCenter];
    [numLabel setFont:[UIFont systemFontOfSize:13.0f]];
    [markView addSubview:numLabel];
    
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

#pragma mark RequestData
- (void)requestHairdresserInfoData
{
    NSDictionary *hairdressDic = @{@"id":self.hairdressId};
    [ASSNetWoringHttpRequestManager requestInterfaceWithParameters:hairdressDic andURL:ASSHairdresserInfo andBlock:^(ASSHttpState state, NSDictionary *responseDictionary) {
        if (state == ASSHttpStateOK) {
            _isWorkRequest = YES;
            [_headImgView setImageWithURL:[NSURL URLWithString:responseDictionary[@"data"][@"hair_banner"]] placeholderImage:[UIImage imageNamed:@"personal_head"]];
            [_nameLabel setText:responseDictionary[@"data"][@"hairdresser_name"]];
            [_numberLabel setText:responseDictionary[@"data"][@"order_num"]];
            _starRateView.scorePercent = [responseDictionary[@"data"][@"start_level"] intValue]/5;
            [_evaluateLabel setText:[NSString stringWithFormat:@"接单数：%@",responseDictionary[@"data"][@"evaluation_num"]]];
            [_professionalLabel setText:[NSString stringWithFormat:@"专业：%@",responseDictionary[@"data"][@"professional"]]];
            [_communicateLabel setText:[NSString stringWithFormat:@"沟通：%@",responseDictionary[@"data"][@"communicate"]]];
            [_worksArray addObjectsFromArray:responseDictionary[@"data"][@"hairdprojectList_a"]];
            
            [_worksCollectionView reloadData];
        }
    }];
}

//个人介绍
- (void)requestHairdresserInfo1Data
{
    NSDictionary *hairdressDic = @{@"id":self.hairdressId};
    [ASSNetWoringHttpRequestManager requestInterfaceWithParameters:hairdressDic andURL:ASSHairdresserInfo1 andBlock:^(ASSHttpState state, NSDictionary *responseDictionary) {
        if (state == ASSHttpStateOK) {
            _isPersonalInfoRequest = YES;
        }
    }];
}



@end
