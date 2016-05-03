//
//  UIView+LDHUD.h
//  Elves bookcase
//
//  Created by LD on 16/4/8.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIView (LDHUD)
/** 显示文字提示 */
- (void)showWarning:(NSString *)words;
/** 显示忙提示 */
- (void)showBusyHUD;
/** 隐藏忙提示 */
- (void)hideBusyHUD;
@end