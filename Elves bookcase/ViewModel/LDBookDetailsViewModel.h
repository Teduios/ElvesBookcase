//
//  LDBookDetailsViewModel.h
//  Elves bookcase
//
//  Created by LD on 16/4/12.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDBookDetailsModel.h"

@interface LDBookDetailsViewModel : NSObject

/** 根据UI定义属性和方法 */
@property(nonatomic,copy)NSString *bookName;    //图书名称
@property(nonatomic,copy)NSString *booKAuthor;  //图书作者
@property(nonatomic,copy)NSString *bookDesc;    //图书简介
@property(nonatomic,copy)NSString *readCount;   //阅读次数
@property(nonatomic,assign)NSInteger bookClass; //图书分类
//获取图书封面
- (NSURL *)getIconURL;

/** 根据Model定义属性和方法 */
@property(nonatomic,assign)NSInteger bookID;
@property(nonatomic,strong)LDBookDetailsModel *bookDetails;
@property(nonatomic,strong)NSMutableArray<LDBookDetailsListModel *> *bookDetailsList;
//获取bookDetails对象和bookDetailsList数组
- (void)getBookDetailsAndListWithBookID:(NSInteger)bookID completionHandler:(void(^)(NSError *error))completionHandler;

@end
