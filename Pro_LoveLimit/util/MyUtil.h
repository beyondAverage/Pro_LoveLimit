//
//  MyUtil.h
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyUtil : NSObject
/*
 @param frame:控件的文字
 @param title:标签的文字
 @param font:字体大小
 @param alignment 对齐方式
 @param numberOfLines 显示行数
 @param textColor 文字颜色
 */
+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font textAlignment:(NSTextAlignment)alignment numberOfLines:(NSInteger)numberOfLines textColor:(UIColor *)textColor;

/*
 @param frame:控件的文字
 @param title:标签的文字
 @param font:字体大小
 */
+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font;

//创建按钮的方法
/*
 @param title:按钮文字
 @param 背景图片名字
 @param 事件触发者
 @param 事件行为
 */
+ (UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title bgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action;

//创建UIImageView
/*
 @prama imageName 图片的名字
 */
+ (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName;

@end
