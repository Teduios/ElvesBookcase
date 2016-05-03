//
//  LD_TabBarViewController.m
//  Elves bookcase
//
//  Created by LD on 16/3/26.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDTabBarViewController.h"

#define kFontOfSize 11
#define kColorRed 218
#define kColorGreen 178
#define kColorBlue 115
#define kAlpha 255

@interface LDTabBarViewController ()

@end

@implementation LDTabBarViewController

+(void)initialize {
    if (self == [LDTabBarViewController class]) {
        UITabBarItem *barItem = [UITabBarItem appearance];
        //设置选中时的字体大小
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
        dict1[NSFontAttributeName] = [UIFont systemFontOfSize:kFontOfSize];
        [barItem setTitleTextAttributes:dict1 forState:UIControlStateNormal];
        
        //设置选中时的字体颜色
        NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
        dict2[NSForegroundColorAttributeName] = kRGBColor(kColorRed, kColorGreen, kColorBlue, kAlpha);
        [barItem setTitleTextAttributes:dict2 forState:UIControlStateSelected];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
