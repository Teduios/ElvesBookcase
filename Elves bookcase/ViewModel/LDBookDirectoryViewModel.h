//
//  LDBookDirectoryViewModel.h
//  Elves bookcase
//
//  Created by LD on 16/4/19.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDBookDirectoryViewModel : NSObject

/** 根据UI定义属性和方法 */
- (NSString *)bookDirectoryForIndex:(NSInteger)index; //书籍目录
/** 根据Model定义属性和方法 */
@property (nonatomic, strong)NSMutableArray<NSString *> *allBookDirectory;

- (void)getAllBookDirectoryWithBookName:(NSString *)bookName;

@end
