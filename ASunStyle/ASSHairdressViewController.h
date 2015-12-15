//
//  ASSHairdressViewController.h
//  ASunStyle
//
//  Created by soldier on 15/12/14.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"
#import "CWStarRateView.h"
#import "ASSNetWoringHttpRequestManager.h"
#import "UIImageView+AFNetworking.h"

@interface ASSHairdressViewController : ASSBaseViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView *headImgView;             //头像
@property (nonatomic, strong) UILabel       *nameLabel;                 //姓名
@property (nonatomic, strong) UILabel       *numberLabel;               //接单数
@property (nonatomic, strong) CWStarRateView *starRateView;         //星星
@property (nonatomic, strong) UIView        *middleView;
@property (nonatomic, strong) UILabel       *evaluateLabel;             //用户评价数
@property (nonatomic, strong) UILabel       *professionalLabel;         //专业度
@property (nonatomic, strong) UILabel       *communicateLabel;         //沟通度
@property (nonatomic, strong) UIView        *personalInfoView;
@property (nonatomic, strong) UICollectionView *worksCollectionView;
@property (nonatomic, strong) NSMutableArray *worksArray;
@property (nonatomic, assign) BOOL           isWorkRequest;
@property (nonatomic, assign) BOOL           isPersonalInfoRequest;
@property (nonatomic, strong) NSString       *hairdressId;



@end
