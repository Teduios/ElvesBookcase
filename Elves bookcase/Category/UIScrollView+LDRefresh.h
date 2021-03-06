//
//  UIScrollView+LDRefresh.h
//  Elves bookcase
//
//  Created by LD on 16/4/8.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@interface UIScrollView (LDRefresh)
/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 开始头部刷新 */
- (void)beginHeaderRefresh;
/** 结束头部刷新 */
- (void)endHeaderRefresh;

/** 添加脚部自动刷新 */
- (void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 添加脚部返回刷新 */
- (void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 开始脚部刷新 */
- (void)beginFooterRefresh;
/** 结束脚部刷新 */
- (void)endFooterRefresh;

@end
