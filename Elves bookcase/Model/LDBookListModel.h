//
//  LDBookListModel.h
//  Elves bookcase
//
//  Created by LD on 16/4/6.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LDBookListListModel;
@interface LDBookListModel : NSObject

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) BOOL status;

@property (nonatomic, strong) NSArray<LDBookListListModel *> *list;
//totalpage -> totalPage
@property (nonatomic, assign) NSInteger totalPage;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@end

@interface LDBookListListModel : NSObject

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) NSInteger fcount;

@property (nonatomic, copy) NSString *img;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger rcount;

@property (nonatomic, copy) NSString *count;
//bookclass -> bookClass
@property (nonatomic, assign) NSInteger bookClass;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, assign) long long time;

@property (nonatomic, copy) NSString *name;

@end