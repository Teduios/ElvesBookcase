//
//  LDPageContentViewController.m
//  Elves bookcase
//
//  Created by LD on 16/4/16.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDPageContentViewController.h"
#import "LDReadMainViewController.h"

@interface LDPageContentViewController ()
{
    BOOL isResult;
}

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomViewConstraint;

@end

@implementation LDPageContentViewController

#pragma mark - 方法
<<<<<<< HEAD
//主题背景
- (IBAction)themeBtn:(UIButton *)sender {
    BOOL isColor = NO;
    NSString *imageName = [NSString stringWithFormat:@"read_bg_%ld",sender.tag];
=======
- (IBAction)themeBtn:(UIButton *)sender {
    BOOL isColor = NO;
    NSString *imageName = [NSString stringWithFormat:@"read_bg_%ld",(long)sender.tag];
>>>>>>> c4602e229b093ca6941f64069653cd1757a4969c
    self.bgImageView.image = [UIImage imageNamed:imageName];
    if (sender.tag == 3) {
        isColor = YES;
        self.textView.textColor = [UIColor whiteColor];
    }else {
        self.textView.textColor = [UIColor blackColor];
    }
    //获取偏好设置对象
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //保存数据
    [userDefaults setObject:imageName forKey:@"imageName"];
    [userDefaults setBool:isColor forKey:@"Color"];
}
//点击返回
- (IBAction)clickBackBtn:(id)sender {
    //保存当前页数至偏好设置
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:self.pageIndex forKey:self.bookName];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//点击屏幕中心
- (IBAction)clickCenterBtn:(id)sender {
    //是否显示状态栏
    [[UIApplication sharedApplication]setStatusBarHidden:isResult withAnimation:UIStatusBarAnimationFade];
    //改变约束来显示topView和buttomView
    if (!isResult) {
        self.topViewConstraint.constant = 0;
        self.buttomViewConstraint.constant = 0;
    }else {
<<<<<<< HEAD
        self.topViewConstraint.constant = -80;
=======
        self.topViewConstraint.constant = -60;
>>>>>>> c4602e229b093ca6941f64069653cd1757a4969c
        self.buttomViewConstraint.constant = -100;
    }
    isResult = !isResult;
}

//展示书籍内容
- (void)showBookContent {
    //设置文本和书名
    self.textView.text = self.pageText;
    self.bookNameLabel.text = self.bookName;
    isResult = NO;
    //获取偏好设置对象
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *imageName = [userDefaults objectForKey:@"imageName"];
    if (imageName == nil) {
        imageName = @"read_bg_0";
    }
    BOOL isColor = [userDefaults boolForKey:@"Color"];
    //设置主题背景和字体颜色
    self.bgImageView.image = [UIImage imageNamed:imageName];
    if (isColor) {
        self.textView.textColor = [UIColor whiteColor];
    }else {
        self.textView.textColor = [UIColor blackColor];
    }
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    //展示书籍内容
    [self showBookContent];
    //状态栏显示
    [[UIApplication sharedApplication]setStatusBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
