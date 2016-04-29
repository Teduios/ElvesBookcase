//
//  LDBookDetailsModel.h
//  Elves bookcase
//
//  Created by LD on 16/4/6.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LDBookDetailsListModel;
@interface LDBookDetailsModel : NSObject

@property (nonatomic, assign) NSInteger fcount;
//bookclass -> bookClass 书籍类型
@property (nonatomic, assign) NSInteger bookClass;
//id -> ID 书籍ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) BOOL status;
//作者
@property (nonatomic, copy) NSString *author;
//阅读次数
@property (nonatomic, copy) NSString *count;

@property (nonatomic, assign) long long time;
//图书封面
@property (nonatomic, copy) NSString *img;
//简介
@property (nonatomic, copy) NSString *summary;
//章节列表
@property (nonatomic, strong) NSArray<LDBookDetailsListModel *> *list;
//书名
@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger rcount;

@end

@interface LDBookDetailsListModel : NSObject
//id -> ID
/** 章节ID */
@property (nonatomic, assign) NSInteger ID;
/** 章节内容 */
@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger seq;
/** 图书ID */
@property (nonatomic, assign) NSInteger book;
/** 章节标题 */
@property (nonatomic, copy) NSString *title;

@end

