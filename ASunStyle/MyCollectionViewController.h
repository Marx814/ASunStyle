//
//  MyCollectionViewController.h
//  ASunStyle
//
//  Created by soldier on 15/10/26.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "ASSBaseViewController.h"

@interface MyCollectionViewController : ASSBaseViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView  *myCollectionView;
}

@end
