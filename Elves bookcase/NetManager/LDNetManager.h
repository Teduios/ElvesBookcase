//
//  LDNetManager.h
//  Elves bookcase
//
//  Created by LD on 16/4/7.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDBookListModel.h"
#import "LDBookDetailsModel.h"

@interface LDNetManager : NSObject

/** 用于请求图书列表信息 */
+ (void)getBookListWithCategory:(NSInteger)categoryID page:(NSInteger)page completionHandler:(void(^)(LDBookListModel *model, NSError *error))completionHandler;



/** 用于请求图书详情信息 */
+ (void)getBookDetailsWithBookList:(NSInteger)BookID completionHandler:(void (^)(LDBookDetailsModel *model, NSError *error))completionHandler;

@end
