//
//  MyUtil.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil

+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font textAlignment:(NSTextAlignment)alignment numberOfLines:(NSInteger)numberOfLines textColor:(UIColor *)textColor;
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (title) {
        label.text = title;
    }
    if (font) {
        label.font = font;
    }
    label.textAlignment = alignment;
    label.numberOfLines = numberOfLines;
    if (textColor) {
        label.textColor = textColor;
    }
    return label;
}

+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [self createLabelFrame:frame title:title font:font textAlignment:NSTextAlignmentLeft numberOfLines:1 textColor:[UIColor blackColor]];
    return label;
}

+ (UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title bgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (bgImageName) {
        [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    return btn;
}

+ (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    return imageView;
}
@end
