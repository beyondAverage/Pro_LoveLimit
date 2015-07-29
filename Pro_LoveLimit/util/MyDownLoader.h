//
//  MyDownLoader.h
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import <Foundation/Foundation.h>

//前置声明
@class MyDownLoader;

@protocol MyDownloaderDelegate <NSObject>

//下载失败
- (void)downloader:(MyDownLoader *)downloader failWithError:(NSError *)error;
//下载成功,并且下载结束
- (void)downloaderFinish:(MyDownLoader *)downloader;

@end

/*
        基本类型  代理属性  其他对象
 MRC    assign   assign   retain
 ARC    assign   weak     strong
 */

//协议:NSURLConnectionDelegate处理是下载成功还是失败
//协议:NSURLConnectionDataDelegate用来处理下载成功时候网络返回的数据
@interface MyDownLoader : NSObject<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

//代理属性
@property (nonatomic,weak)id<MyDownloaderDelegate> delegate;
//获取下载回来的数据 只读方式 只有getter方式
@property (nonatomic,readonly)NSData *receiveData;

- (void)downWithUrlString:(NSString *)urlString;

@end
