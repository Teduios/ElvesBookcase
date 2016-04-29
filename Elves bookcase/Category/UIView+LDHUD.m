//
//  UIView+LDHUD.m
//  Elves bookcase
//
//  Created by LD on 16/4/8.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "UIView+LDHUD.h"

#define kShowWarningDelayDuration   1
#define kTimeoutDuration 30

@implementation UIView (LDHUD)

- (void)showWarning:(NSString *)words{
    //为使用者考虑, 如果子线程执行此方法会崩溃, 我们要把方法做成线程安全的.
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = words;
        [hud hide:YES afterDelay:kShowWarningDelayDuration];
    });
}
- (void)showBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        [[MBProgressHUD showHUDAddedTo:self animated:YES] hide:YES afterDelay:kTimeoutDuration];
    });
}
- (void)hideBusyHUD{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
    });
    
}

@end
