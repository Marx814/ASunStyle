//
//  ASSReservationViewController.h
//  ASunStyle
//
//  Created by Marx on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"

#import "ASSNetWoringHttpRequestManager.h"

#import "ASSClassCollectionViewCell.h"
#import "ASSProjectCollectionViewCell.h"

#import "UIImage+Color.h"

#import "ASSProjectDetailViewController.h"

@interface ASSReservationViewController : ASSBaseViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic)UICollectionView *classCollectionView;
@property(nonatomic)NSArray *classArray;
@property(nonatomic)NSInteger selectClassItem;
@property(nonatomic)ASSClassCollectionViewCell *selectClassCell;

@property(nonatomic)UIView *filterView;

@property(nonatomic)NSString *filterStr;

@property(nonatomic)UICollectionView *projectCollectionView;
@property(nonatomic)NSMutableArray *projectArray;
@end
