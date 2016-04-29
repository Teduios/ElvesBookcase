//
//  LDBookcaseViewModel.h
//  Elves bookcase
//
//  Created by LD on 16/4/13.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDBookcaseModel.h"

@interface LDBookcaseViewModel : NSObject
/** 根据UI定义属性和方法 */
- (UIImage *)iconImageForIndex:(NSInteger)index;    //封面
- (NSString *)bookAuthorForIndex:(NSInteger)index;  //作者
- (NSString *)bookNameForIndex:(NSInteger)index;    //书名

/** 根据Model定义属性和方法 */
@property(nonatomic,strong)NSMutableArray<LDBookcaseModel *> *allBook;

- (void)getAllBook;

@end
