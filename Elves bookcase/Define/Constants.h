//
//  Constants.h
//  Elves bookcase
//
//  Created by LD on 16/3/28.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/** RGB颜色宏 */
#define kRGBColor(R,G,B,Alpha) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:Alpha]

//在宏中使用\可以达到换行的效果
#define WK(weakSelf) __weak __typeof(&*self)weakSelf = self;

//屏幕的宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif /* Constants_h */
