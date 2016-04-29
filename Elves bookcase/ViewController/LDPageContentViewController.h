//
//  LDPageContentViewController.h
//  Elves bookcase
//
//  Created by LD on 16/4/16.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDPageContentViewController : UIViewController
/** 当前页的下标 */
@property (nonatomic, assign) NSInteger pageIndex;
/** 当前页的内容 */
@property (nonatomic, copy) NSString *pageText;
/** 书籍名称 */
@property (nonatomic, copy) NSString *bookName;

@end
