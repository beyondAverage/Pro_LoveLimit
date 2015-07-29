//
//  MainTabBarViewController.m
//  Pro_LoveLimit
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createControllers];
}

//创建视图控制器
- (void)createControllers
{
    NSArray *ctrArray = @[@"LimitFreeViewController",@"ReduceViewController",@"FreeViewController",@"SubjectViewController",@"HotViewController"];
    //标题文字
    NSArray *nameArray = @[@"限免",@"降价",@"免费",@"专题",@"热榜"];
    //图片
    NSArray *imageArray = @[@"tabbar_limitfree",@"tabbar_reduceprice",@"tabbar_appfree",@"tabbar_subject",@"tabbar_rank"];
    NSArray *selectedImageArray = @[@"tabbar_limitfree_press",@"tabbar_reduceprice_press",@"tabbar_appfree_press",@"tabbar_subject_press",@"tabbar_rank_press"];
    NSMutableArray *navArray = [NSMutableArray array];
    for (int i=0; i<ctrArray.count; i++) {
        //获取类名字
        NSString *className = ctrArray[i];
        //获取类对象
        Class class = NSClassFromString(className);
        //创建视图控制器
        UIViewController *vc = [[class alloc] init];
        vc.tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.title = nameArray[i];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [navArray addObject:nav];
    }
    self.viewControllers = navArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
