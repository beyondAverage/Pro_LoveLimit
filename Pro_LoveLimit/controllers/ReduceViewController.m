//
//  ReduceViewController.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "ReduceViewController.h"
#import "ReduceCell.h"
#import "LimitModel.h"

@interface ReduceViewController ()<MyDownloaderDelegate>

@end

@implementation ReduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createMyNav];
    
}


- (void)createMyNav
{
    [self addNavTitle:CGRectMake(60, 0, 255, 44) title:@"降价"];
    //分类
    [self addNavBtn:CGRectMake(0, 0, 60, 40) title:@"分类" target:self action:@selector(gotoCategory:) isLeft:YES];
    [self addNavBtn:CGRectMake(0, 0, 60, 40) title:@"设置" target:self action:@selector(gotoSet:) isLeft:NO];
}
//分类
- (void)gotoCategory:(id)sender{}
//设置
- (void)gotoSet:(id)sender{}

- (void)downloadData
{
    //进入刷新状态
    _isLoding = YES;
    
    MyDownLoader *downloader = [[MyDownLoader alloc] init];
    downloader.delegate = self;
    
    NSString *urlString = [NSString stringWithFormat:kReduceUrl,_currentPage];
    [downloader downWithUrlString:urlString];
}


#pragma mark --MyDownloaderDelegate--
- (void)downloader:(MyDownLoader *)downloader failWithError:(NSError *)error
{
    NSLog(@"下载失败 error = %@",error);
}
- (void)downloaderFinish:(MyDownLoader *)downloader
{
    //下拉刷新
    //一定写在下载数据返回的地方
    if (_currentPage == 1) {
        [_dataArray removeAllObjects];
    }
    
    //JSON解析
    id result = [NSJSONSerialization JSONObjectWithData:downloader.receiveData options:NSJSONReadingMutableContainers error:nil];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = result;
        
        NSArray *appArray = [dict objectForKey:@"applications"];
        for (NSDictionary *appDict in appArray) {
            //创建模型
            LimitModel *model = [[LimitModel alloc] init];
            [model setValuesForKeysWithDictionary:appDict];
            [_dataArray addObject:model];
        }
    }
    [_tbView reloadData];
    
    //结束刷新
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
    static NSString *cellID = @"reduceCellId";
    ReduceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ReduceCell" owner:nil options:nil] lastObject];
    }
    LimitModel *model = _dataArray[indexPath.row];
    [cell configModel:model index:indexPath.row];
    return cell;
}

#pragma mark --MJ--
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (_isLoding) {
        return;
    }
    if (refreshView == _mjRefreshHeaderView) {
        _currentPage = 1;
        [self downloadData];
    }
    if (refreshView == _mjRefreshFooterView) {
        _currentPage ++;
        [self downloadData];
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
