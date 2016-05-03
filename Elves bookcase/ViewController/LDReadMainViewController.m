//
//  LDReadMainViewController.m
//  Elves bookcase
//
//  Created by LD on 16/4/15.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDReadMainViewController.h"
#import "pagingContent.h"
#import "LDPageContentViewController.h"

@interface LDReadMainViewController ()

@property(nonatomic, copy)NSString *bookName;

@end

@implementation LDReadMainViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    //获取书籍每页的内容
    [self achieveBookPageContent];
    //获得storyboard上的pageViewController
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageViewController"];
    self.pageViewController.dataSource = self;
    //设置起始页
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger currentIndex = [userDefaults integerForKey:self.bookName];
    MYLog(@"%ld",currentIndex);
    LDPageContentViewController *startingViewController = [self viewControllerAtIndex:currentIndex];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    self.pageViewController.view.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPageViewControllerDataSource
//返回上一页自动调用
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    //关闭用户交互
    self.view.userInteractionEnabled = NO;
    //用多线程延时0.5秒，再打开用户交互
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.view.userInteractionEnabled = YES;
    });
    
    NSUInteger index = ((LDPageContentViewController *)viewController).pageIndex;
    if ((index == 0)||(index == NSNotFound)) {
        [self.view showWarning:@"已经是第一页了"];
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}
//去下一页自动调用
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    //关闭用户交互
    self.view.userInteractionEnabled = NO;
    //用多线程延时0.5秒，再打开用户交互
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.view.userInteractionEnabled = YES;
    });
    
    NSUInteger index = ((LDPageContentViewController *) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageContents count]) {
        [self.view showWarning:@"已经是最后一页了"];
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
//总页数
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageContents count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

#pragma mark - 方法
//设置index页的内容
- (LDPageContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    if ((self.pageContents.count == 0)||(index >= self.pageContents.count)) {
        return nil;
    }
    LDPageContentViewController *readContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageContentViewController"];
    readContentViewController.pageText = self.pageContents[index];
    readContentViewController.pageIndex = index;
    readContentViewController.bookName = self.bookName;
    
    return readContentViewController;
}

//获取书籍每页的内容
- (void)achieveBookPageContent {
    
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *bookFilePath = [NSString stringWithFormat:@"%@/ElvesBookcase/%@/%@.txt",documentsPath,self.bookName,self.bookName];
    MYLog(@"%@",self.bookName);
    NSString *str = [NSString stringWithContentsOfFile:bookFilePath encoding:NSUTF8StringEncoding error:nil];
    
    pagingContent *paging = [[pagingContent alloc]init];
    
    //设置文本字体和内容
    NSInteger pageCount = [paging pageCountForWithContentText:str andWithContentFont:18];
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < pageCount; i++) {
        NSString *str = [paging stringOfPage:i];
        [arr addObject:str];
    }
    self.pageContents = arr;
}

//获取传入的书籍名称
- (void)getBookName:(NSString *)bookName {
    self.bookName = bookName;
}

@end
