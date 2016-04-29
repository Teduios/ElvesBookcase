//
//  LDBookcaseViewModel.h
//  Elves bookcase
//
//  Created by LD on 16/4/7.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDNetManager.h"

typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh, //刷新数据
    RequestModeMore, //获取更多数据
};

@interface LDBookListViewModel : NSObject
/** 根据UI定义属性和方法 */
@property(nonatomic,assign)NSInteger rowNumber; //行数
- (NSURL *)iconURLForIndex:(NSInteger)index;    //图书封面
- (NSString *)bookNameForIndex:(NSInteger)index;//图书名称
- (NSString *)booKAuthorIndex:(NSInteger)index; //图书作者
- (NSString *)bookDescForIndex:(NSInteger)index;//图书简介

/** 根据Model定义属性和方法 */
@property(nonatomic,strong)NSMutableArray<LDBookListListModel *> *bookList;
@property(nonatomic,assign)NSInteger page;
//获取图书的ID
- (NSInteger)getBookID:(NSInteger)index;
//获取图书列表数组
- (void)getBookListListWithCategory:(NSInteger)categoryID requestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;

@end
