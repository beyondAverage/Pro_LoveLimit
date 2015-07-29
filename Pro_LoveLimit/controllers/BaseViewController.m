//
//  BaseViewController.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "BaseViewController.h"
#import "MyUtil.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //下载
    _dataArray = [NSMutableArray array];
    
    [self createTableView];
    
    _isLoding = NO;
    _currentPage = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addNavBtn:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action isLeft:(BOOL)isLeft
{
    //创建一个按钮
    UIButton *btn = [MyUtil createBtnFrame:frame title:title bgImageName:@"buttonbar_action" target:target action:action];
    //UIBarButtonItem
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = item;
    }else{
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)addNavTitle:(CGRect)frame title:(NSString *)title
{
    UIColor *color = [UIColor colorWithRed:80.0f/255.0f green:180.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    UILabel *label = [MyUtil createLabelFrame:frame title:title font:[UIFont boldSystemFontOfSize:25] textAlignment:NSTextAlignmentCenter numberOfLines:1 textColor:color];
    self.navigationItem.titleView = label;
}

- (void)createTableView
{
    //在导航栏下显示tableView
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375, 667-64-49) style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    _tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tbView];
    
    
    
    _mjRefreshHeaderView = [MJRefreshHeaderView header];
    _mjRefreshHeaderView.scrollView = _tbView;
    _mjRefreshHeaderView.delegate = self;
    
    _mjRefreshFooterView = [MJRefreshFooterView footer];
    _mjRefreshFooterView.scrollView = _tbView;
    _mjRefreshFooterView.delegate = self;
    
    [_mjRefreshHeaderView beginRefreshing];
    
}

- (void)dealloc
{
    _mjRefreshFooterView.scrollView = nil;
    _mjRefreshHeaderView.scrollView = nil;
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"子类必须实现方法%s",__FUNCTION__);
    return nil;
}

@end
