//
//  LimitFreeViewController.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "LimitFreeViewController.h"
#import "LimitModel.h"
#import "LimitCell.h"


@interface LimitFreeViewController ()<MyDownloaderDelegate>
{
    
}
@end

@implementation LimitFreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createMyNav];
    
    //[self createTableView];
    
    //_dataArray = [NSMutableArray array];
    
}
//下载数据
- (void)downloadData
{
    //修改下载的状态
    _isLoding = YES;
    
    MyDownLoader *downloader = [[MyDownLoader alloc] init];
    downloader.delegate = self;
    
    NSString *urlString = [NSString stringWithFormat:kLimitUrl,_currentPage];
    [downloader downWithUrlString:urlString];
}

- (void)createMyNav
{
    [self addNavTitle:CGRectMake(60, 0, 255, 44) title:@"限免"];
    //分类
    [self addNavBtn:CGRectMake(0, 0, 60, 40) title:@"分类" target:self action:@selector(gotoCategory:) isLeft:YES];
    [self addNavBtn:CGRectMake(0, 0, 60, 40) title:@"设置" target:self action:@selector(gotoSet:) isLeft:NO];
}

- (void)gotoCategory:(id)sender
{
    
}
- (void)gotoSet:(id)sender
{
    
}

#pragma mark --MyDownloaderDelegate--
- (void)downloader:(MyDownLoader *)downloader failWithError:(NSError *)error
{
    NSLog(@"%@",error);
}
- (void)downloaderFinish:(MyDownLoader *)downloader
{
    //刷新 下载成功移除所有数据
    if (_currentPage == 1) {
        [_dataArray removeAllObjects];
    }
    //解析数据
    id result = [NSJSONSerialization JSONObjectWithData:downloader.receiveData options:NSJSONReadingMutableContainers error:nil];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = result;
        NSArray *appArray = dict[@"applications"];
        for (NSDictionary *appDict in appArray) {
            LimitModel *model = [[LimitModel alloc] init];
            //kvc设置属性
            [model setValuesForKeysWithDictionary:appDict];
            //添加Model到数组中
            [_dataArray addObject:model];
        }
    }
    //刷新表格
    [_tbView reloadData];
    
    
    //修改下载状态
    _isLoding = NO;
    
    [_mjRefreshHeaderView endRefreshing];
    [_mjRefreshFooterView endRefreshing];
}

#pragma mark --UITableViewDelegate,UITableViewDataSource--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"limitCellId";
    LimitCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LimitCell" owner:nil options:nil] lastObject];
    }
    //模型对象
    LimitModel *model = _dataArray[indexPath.row];
    [cell configModel:model index:indexPath.row];
    
    return cell;
}

#pragma mark --MJRefreshBaseViewDelegate--
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    NSLog(@"%s",__FUNCTION__);
    if (_isLoding) {
        return;
    }
    if (refreshView == _mjRefreshHeaderView) {
        _currentPage = 1;
        [self downloadData];
    }else if(refreshView == _mjRefreshFooterView)
    {
        //加载下一页
        _currentPage ++;
        [self downloadData];
    }
}
- (void)refreshViewEndRefreshing:(MJRefreshBaseView *)refreshView
{
    NSLog(@"%s",__FUNCTION__);
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
