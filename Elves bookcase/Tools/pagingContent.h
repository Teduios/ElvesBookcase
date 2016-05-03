//
//  pagingContent.h
//  pageDemo1
//
//  Created by LD on 16/4/16.
//  Copyright © 2016年 terana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface pagingContent : NSObject

//通过设置的文本和字体大小返回页数
- (NSInteger)pageCountForWithContentText:(NSString *)contentText andWithContentFont:(NSUInteger)contentFont;
//返回每页的文本内容
- (NSString *)stringOfPage:(NSUInteger)page;

@end
