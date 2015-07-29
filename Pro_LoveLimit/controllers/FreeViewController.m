//
//  FreeViewController.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "FreeViewController.h"
#import "LimitModel.h"

@interface FreeViewController ()<MyDownloaderDelegate>

@end

@implementation FreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createMyNav];
    
    [self downloadData];
}


- (void)createMyNav
{
    [self addNavTitle:CGRectMake(60, 0, 255, 44) title:@"免费"];
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
    
    NSString *urlString = [NSString stringWithFormat:kFreeUrl,_currentPage];
    [downloader downWithUrlString:urlString];
}

#pragma  mark --MyDownloaderDelegate--
- (void)downloader:(MyDownLoader *)downloader failWithError:(NSError *)error
{
    NSLog(@"免费:Error = %@",error);
}
- (void)downloaderFinish:(MyDownLoader *)downloader
{
    //下载完成,解析数据
    id result = [NSJSONSerialization JSONObjectWithData:downloader.receiveData options:NSJSONReadingMutableContainers error:nil];
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary *apps = result;
        NSArray *appArray = [apps objectForKey:@"applications"];
        for (NSDictionary *app in appArray) {
            LimitModel *model = [[LimitModel alloc] init];
            [model setValuesForKeysWithDictionary:app];
            
            [_dataArray addObject:model];
        }
    }
}

#pragma mark --tableView的代理,数据源--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"freeCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
    }
    return cell;
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
