//
//  StarView.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "StarView.h"
#import "MyUtil.h"

@implementation StarView

//代码方式初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self createImageView];
    }
    return self;
}
//xib初始化
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        [self createImageView];
    }
    return self;
}

//初始化图片
- (void)createImageView
{
    UIImageView *bgImageView = [MyUtil createImageViewFrame:CGRectMake(0, 0, 65, 23) imageName:@"StarsBackground"];
    [self addSubview:bgImageView];
    
    //星级前景图片
    UIImageView *fgImageView = [MyUtil createImageViewFrame:CGRectMake(0, 0, 65, 23) imageName:@"StarsForeground"];
    fgImageView.tag = 200;
    //设置停靠模式
    fgImageView.contentMode = UIViewContentModeLeft;
    fgImageView.clipsToBounds = YES;
    [self addSubview:fgImageView];
}

- (void)setRating:(float)rating
{
    //修改前面视图的frame
    UIImageView *imageView = (UIImageView *)[self viewWithTag:200];
    imageView.frame = CGRectMake(0, 0, 65*rating/5.0f, 23);
}










/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
