//
//  LDReadMainViewController.h
//  Elves bookcase
//
//  Created by LD on 16/4/15.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDReadMainViewController : UIViewController<UIPageViewControllerDataSource>

@property(nonatomic,strong)UIPageViewController *pageViewController;
//每页内容的数组
@property(nonatomic,strong)NSArray<NSString *> *pageContents;
//获取书籍名称
- (void)getBookName:(NSString *)bookName;

@end
