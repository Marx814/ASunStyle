//
//  OrderDetailViewController.m
//  ASunStyle
//
//  Created by soldier on 15/11/4.
//  Copyright © 2015年 Marx. All rights reserved.
//

#import "OrderDetailViewController.h"

@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromHex(0xfde0f0, 1);
    
    [self setOrderDetailCustomView];

}

- (void)setOrderDetailCustomView
{
    kViewHeight = 0;
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, kScreenWidth , 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    //用户头像
    UIImageView *headImgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 85, 85)];
    headImgV.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    headImgV.layer.borderWidth = 0.5f;
    headImgV.layer.masksToBounds = YES;
    headImgV.layer.cornerRadius = 42.5;
    headImgV.image = [UIImage imageNamed:@"personal_head"];
    [self.view addSubview:headImgV];
    
    //订单名称
    UILabel *orderTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(105, 20, kScreenWidth-110 , 15)];
    [orderTitleLab setText:@"冷烫C系：主要服务很多很多的范围"];
    [orderTitleLab setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [orderTitleLab setTextColor:UIColorFromHex(0x333333, 1)];
    [self.view addSubview:orderTitleLab];
    
    //评价等级
    UILabel *evaluationLevelLab = [[UILabel alloc] initWithFrame:CGRectMake(105, 50, kScreenWidth-110, 10)];
    [evaluationLevelLab setText:@"评价等级：5"];
    [evaluationLevelLab setFont:[UIFont systemFontOfSize:12.0f]];
    [evaluationLevelLab setTextColor:UIColorFromHex(0x333333, 1)];
    [self.view addSubview:evaluationLevelLab];
    
    //星星
    
    kViewHeight += 105;
    
    //分割线
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kViewHeight-1, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    //满意度 View
    UIView *satisfactionView = [[UIView alloc] initWithFrame:CGRectMake(0, kViewHeight, kScreenWidth, 70)];
    [satisfactionView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:satisfactionView];
    
    NSArray *expressionTitleArray = @[@"强烈推荐",@"很满意",@"满意",@"一般",@"差"];
    NSArray *expressionImgArray = @[@"evaluation_one",@"evaluation_two",@"evaluation_three",@"evaluation_four",@"evaluation_five"];
    for (int i = 0; i<5; i++) {
        UIImageView *expressionImgV = [[UIImageView alloc] initWithFrame:CGRectMake(19.5+64*i*kScreenWidth/320, 10, 25*kScreenWidth/320, 25*kScreenWidth/320)];
        [expressionImgV setImage:[UIImage imageNamed:expressionImgArray[i]]];
        [expressionImgV setTag:(100+i)];
        [satisfactionView addSubview:expressionImgV];
        
        UILabel *expressionLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/5*i, expressionImgV.frame.origin.y + expressionImgV.frame.size.height , kScreenWidth/5, 20)];
        [expressionLabel setTag:(200+i)];
        [expressionLabel setTextAlignment:NSTextAlignmentCenter];
        [expressionLabel setText:expressionTitleArray[i]];
        [expressionLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [expressionLabel setTextColor:UIColorFromHex(0x333333, 1)];
        [satisfactionView addSubview:expressionLabel];
        
        UIButton *expressionBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth/5*i, 10, kScreenWidth/5, expressionImgV.frame.size.height + expressionLabel.frame.size.height)];
        [expressionBtn setBackgroundColor:[UIColor clearColor]];
        [expressionBtn setTag:(300+i)];
        [expressionBtn addTarget:self action:@selector(clickExpressionBtn:) forControlEvents:UIControlEventTouchUpInside];
        [satisfactionView addSubview:expressionBtn];
        
    }
    
    //分割线
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kViewHeight-1, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    kViewHeight+= 75;
    
    //评论comment View
    UIView *commentView = [[UIView alloc] initWithFrame:CGRectMake(5, kViewHeight, kScreenWidth-10, 100)];
    [commentView setBackgroundColor:[UIColor whiteColor]];
    commentView.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
    commentView.layer.borderWidth = 0.5f;
    [self.view addSubview:commentView];
    
    kViewHeight += 105;
    
    commentTextView = [[UITextView alloc] initWithFrame:CGRectMake(5, 5, commentView.frame.size.width -10, commentView.frame.size.height -10)];
    [commentTextView setBackgroundColor:[UIColor clearColor]];
    [commentTextView setDelegate:self];
    [commentView addSubview:commentTextView];
    
    //三个图片（不知道是干嘛的）
    for (int j = 0; j<3; j++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((5+105*j)*kScreenWidth/320, kViewHeight, 100*kScreenWidth/320 , 100*kScreenWidth/320)];
        imgView.layer.borderWidth = 0.5;
        imgView.layer.borderColor = [UIColorFromHex(0xf421ae, 1) CGColor];
        [imgView setImage:[UIImage imageNamed:@"personal_head"]];
        [self.view addSubview:imgView];
    }
    
    kViewHeight += 100*kScreenWidth/320 +5;
    
    //分割线
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kViewHeight-1, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    //匿名评价
    UIView *anonymityView = [[UIView alloc] initWithFrame:CGRectMake(0, kViewHeight, kScreenWidth, 20)];
    [anonymityView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:anonymityView];
    
    //
    UILabel *anonymityLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-100, 0 , 70, 20)];
    [anonymityLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [anonymityLabel setTextAlignment:NSTextAlignmentRight];
    [anonymityLabel setText:@"匿名评价"];
    [anonymityLabel setTextColor:UIColorFromHex(0xf421ae, 1)];
    [anonymityView addSubview:anonymityLabel];
    
    kViewHeight += 20;
    //分割线
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kViewHeight-1, kScreenWidth, 1)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
        kViewHeight += 5;
    
    
    //华丽的分割线
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-64-62, kScreenWidth, 2)];
    [lineView setBackgroundColor:UIColorFromHex(0xf421ae, 1)];
    [self.view addSubview:lineView];
    
    UIView *confirmBgView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-64-60, kScreenWidth, 60)];
    [confirmBgView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:confirmBgView];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setFrame:CGRectMake(60, 20, kScreenWidth-120, 20)];
    [confirmBtn setBackgroundImage:[UIImage imageNamed:@"evaluation_confirm"] forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(clickConfirmBtn:) forControlEvents:UIControlEventTouchUpInside];
    [confirmBgView addSubview:confirmBtn];
    
}

#pragma mark -- 
- (void)clickExpressionBtn:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    for (int i = 0; i<5; i++) {
        UILabel *label = (UILabel *)[self.view viewWithTag:(i+200)];
        [label setTextColor:[UIColor blackColor]];
    }
    UILabel *label = (UILabel *)[self.view viewWithTag:(btn.tag-100)];
    [label setTextColor:UIColorFromHex(0xf421ae, 1)];
    
}

#pragma mark -- 评价 按钮
- (void)clickConfirmBtn:(UIButton *)button
{
    NSLog(@"评价 发布");
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
