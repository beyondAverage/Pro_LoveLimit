//
//  BaseViewController.h
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Const.h"
#import "MyDownLoader.h"
#import "MJRefresh.h"

@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>
{
    //数据源数据
    NSMutableArray *_dataArray;
    //表格
    UITableView *_tbView;
    
    //下拉刷新
    MJRefreshHeaderView *_mjRefreshHeaderView;
    MJRefreshFooterView *_mjRefreshFooterView;
    
    NSInteger _currentPage;
    BOOL _isLoding;
}
//添加导航栏上面的按钮
/*
 @prama isLeft是否是导航栏左侧的按钮
 */
- (void)addNavBtn:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action isLeft:(BOOL)isLeft;

//添加导航栏上面的文字
- (void)addNavTitle:(CGRect)frame title:(NSString *)title;

@end
