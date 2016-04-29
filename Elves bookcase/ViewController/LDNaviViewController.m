//
//  LD_NaviViewController.m
//  Elves bookcase
//
//  Created by LD on 16/3/27.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDNaviViewController.h"

#define kFontOfSize 24

@interface LDNaviViewController ()

@end

@implementation LDNaviViewController

+ (void)initialize {
    if (self == [LDNaviViewController class]) {
        //appearance 是获取 全局的导航条
        UINavigationBar *bar = [UINavigationBar appearance];
        [bar setBackgroundImage:[UIImage imageNamed:@"NaviBg"] forBarMetrics:UIBarMetricsDefault];
        //改变item的颜色
        [bar setTintColor:[UIColor whiteColor]];
        //设置字体相关
        NSMutableDictionary *dic =[NSMutableDictionary dictionary];
        //设置字体
        dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:kFontOfSize];
        //设置字体颜色
        dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [bar setTitleTextAttributes:dic];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //把 tabBarItem中选中时的图片取出 ， 然后设置图片的模式 为 原色,返回一张新的图片
    UIImage *selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //将新的图片 设置为 tabBarItem的选中图片
    self.tabBarItem.selectedImage = selectedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
