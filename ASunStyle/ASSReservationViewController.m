//
//  ASSReservationViewController.m
//  ASunStyle
//
//  Created by Marx on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSReservationViewController.h"

@interface ASSReservationViewController ()

@end

@implementation ASSReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customView];
    _filterStr = @"";
    _projectArray = [[NSMutableArray alloc] init];
    self.refresh = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if (self.refresh) {
        [self requestClassData];
    }
    
    
}

#pragma mark RequestData
- (void)requestClassData
{
    [ASSNetWoringHttpRequestManager requestInterfaceWithParameters:nil andURL:ASSProjectClassUrl andBlock:^(ASSHttpState state, NSDictionary *responseDictionary) {
        if (state == ASSHttpStateOK) {
            _classArray = responseDictionary[@"data"];
            _selectClassItem = 0;
            [_classCollectionView reloadData];
            [self requestProjectData];
        }
    }];
}

- (void)requestProjectData
{
    NSLog(@"%@",_classArray[_selectClassItem][@"id"]);
    NSDictionary *parameter = @{@"id":_classArray[_selectClassItem][@"id"],@"order":_filterStr};
    [ASSNetWoringHttpRequestManager requestInterfaceWithParameters:parameter andURL:ASSProjectUrl andBlock:^(ASSHttpState state, NSDictionary *responseDictionary) {
        if (state == ASSHttpStateOK) {
            [_projectArray addObjectsFromArray:responseDictionary[@"data"]];
            
            [_projectCollectionView reloadData];
            self.refresh= NO;
        }
    }];
}

#pragma mark CustomView
- (void)customView
{
    [self.view addSubview:self.classCollectionView];
    [self.view addSubview:self.filterView];
    [self.view addSubview:self.projectCollectionView];
    
}

- (UICollectionView *)classCollectionView
{
    if (!_classCollectionView) {
        _classCollectionView = ({
            UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
            [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
            
            UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150) collectionViewLayout:collectionViewFlowLayout];
            [collectionView setBackgroundColor:[UIColor clearColor]];
            [collectionView setDelegate:self];
            [collectionView setDataSource:self];
            [collectionView setTag:100];
            
            [collectionView registerClass:[ASSClassCollectionViewCell class] forCellWithReuseIdentifier:@"ClassCell"];
            collectionView;
        });
    }
    return _classCollectionView;
}

- (UIView *)filterView
{
    if (!_filterView) {
        _filterView = ({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 150, kScreenWidth, 40)];
            [view setBackgroundColor:UIColorFromHex(0xfcd7ed, 1)];
            [view.layer setMasksToBounds:YES];
            [view.layer setBorderColor:UIColorFromHex(0xee008d, 1).CGColor];
            [view.layer setBorderWidth:0.5];
            
            NSArray *titleArray = @[@"综合排名",@"销量排名",@"价格排名"];
            
            for (int i = 0; i<3; i++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setTag:200+i];
                [button setFrame:CGRectMake(kScreenWidth/3*i, 0, kScreenWidth/3, 40)];
                [button setBackgroundColor:[UIColor clearColor]];
                [button setTitleColor:UIColorFromHex(0x000000, 1) forState:UIControlStateNormal];
                [button setTitleColor:UIColorFromHex(0xf00094, 1) forState:UIControlStateSelected];
                [button setTitle:titleArray[i] forState:UIControlStateNormal];
                [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
                
                [view addSubview:button];
            }
            
            
            view;
        });
    }
    
    return _filterView;
}

- (UICollectionView *)projectCollectionView
{
    if (!_projectCollectionView) {
        _projectCollectionView = ({
            UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
            [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
            
            UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 190, kScreenWidth, kScreenHeight-kNavigationBarHight -kTabbarHight -190) collectionViewLayout:collectionViewFlowLayout];
            [collectionView.layer setMasksToBounds:YES];
            [collectionView.layer setBorderColor:UIColorFromHex(0xee008d, 1).CGColor];
            [collectionView.layer setBorderWidth:0.5];
            [collectionView setBackgroundColor:UIColorFromHex(0xfcd7ed, 1)];
            [collectionView setDelegate:self];
            [collectionView setDataSource:self];
            [collectionView setTag:300];
            
            [collectionView registerClass:[ASSProjectCollectionViewCell class] forCellWithReuseIdentifier:@"ProjectCell"];
            collectionView;
        });
    }
    return _projectCollectionView;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView.tag == 100) {
        return 1;
    }else{
        return 1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == 100) {
        return [_classArray count];
    }else{
        return [_projectArray count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 100) {
        static NSString *CellIdentifier = @"ClassCell";
        ASSClassCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        [cell sizeToFit];
        
        [cell.classImageView setImageWithURL:[NSURL URLWithString:_classArray[indexPath.row][@"banner"]] placeholderImage:[UIImage imageWithColor:UIColorFromHex(0xf1f1f1, 1) size:CGSizeMake(40, 40)]];
        [cell.classNameLabel setText:_classArray[indexPath.row][@"type_name"]];
        if (indexPath.row == _selectClassItem) {
            [cell.classNameLabel setTextColor:UIColorFromHex(0xf00094, 1)];
            _selectClassCell = cell;
        }else{
            [cell.classNameLabel setTextColor:UIColorFromHex(0x000000, 1)];
        }
        
        return cell;
    }else{
        static NSString *CellIdentifier = @"ProjectCell";
        ASSProjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        [cell sizeToFit];
        [cell.projectImageView setImageWithURL:[NSURL URLWithString:_projectArray[indexPath.row][@"new_banner"]] placeholderImage:[UIImage imageWithColor:UIColorFromHex(0xf1f1f1, 1) size:CGSizeMake((kScreenWidth-30)/2, 250)]];
        [cell.projectNameLabel setText:_projectArray[indexPath.row][@"project_name"]];
        [cell.projectPriceLabel setText:[NSString stringWithFormat:@"¥%@",_projectArray[indexPath.row][@"project_price"]]];
        [cell.projectSaleLabel setText:[NSString stringWithFormat:@"%@人做过",_projectArray[indexPath.row][@"sales_volume"]]];
        
        return cell;
    }
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 100) {
        return CGSizeMake((kScreenWidth-20)/3, 70);
    }else{
        return CGSizeMake((kScreenWidth-30)/2, 250);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (collectionView.tag == 100) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }else{
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 100) {
        if (indexPath.row != _selectClassItem) {
            [_selectClassCell.classNameLabel setTextColor:UIColorFromHex(0x000000, 1)];
            
            _selectClassCell = (ASSClassCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
            _selectClassItem =  indexPath.row;
            [_selectClassCell.classNameLabel setTextColor:UIColorFromHex(0xf00094, 1)];
        }
    }else{
        ASSProjectDetailViewController *vc = [ASSProjectDetailViewController new];
        vc.projectID = _projectArray[indexPath.row][@"id"];
        [vc setTitle:_projectArray[indexPath.row][@"project_name"]];
        [self.navigationController pushViewController:vc animated:YES];
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
