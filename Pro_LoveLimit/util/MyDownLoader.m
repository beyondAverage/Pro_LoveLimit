//
//  MyDownLoader.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "MyDownLoader.h"

@interface MyDownLoader ()
{
    //下载对象
    NSURLConnection *_conn;
    //存储下载回来的数据
    NSMutableData *_receiveData;
}
@end

@implementation MyDownLoader

- (instancetype)init
{
    self = [super init];
    if (self) {
        //初始化下载数据
        _receiveData = [NSMutableData data];
    }
    return self;
}

- (void)downWithUrlString:(NSString *)urlString
{
    //1.创建UIRL类型的对象
    NSURL *url = [NSURL URLWithString:urlString];
    //2.请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //3.创建NSURLController类型的对象
    _conn = [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark --NSURLConnectionDelegate,NSURLConnectionDataDelegate--
//下载失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (self.delegate) {
        [self.delegate downloader:self failWithError:error];
    }
}
//下载成功
//准备接收数据
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receiveData setLength:0];
}
//接收下载回来的数据 : 会多次调用,由于下载是持续性下载的
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}
//下载完成
//程序会自动切换到主线程
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (self.delegate) {
        [self.delegate downloaderFinish:self];
    }
}
@end
