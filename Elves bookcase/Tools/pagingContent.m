//
//  pagingContent.m
//  pageDemo1
//
//  Created by LD on 16/4/16.
//  Copyright © 2016年 terana. All rights reserved.
//

#import "pagingContent.h"

@interface pagingContent()
{
    CGFloat num;
}

@property (nonatomic, assign)NSUInteger pageCount;
@property (nonatomic, copy)NSString *contentText;

@end

@implementation pagingContent

- (NSInteger)pageCountForWithContentText:(NSString *)contentText andWithContentFont:(NSUInteger)contentFont {
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    textView.font = [UIFont systemFontOfSize:contentFont];
    textView.text = contentText;
    if (SCREEN_HEIGHT < 569) {
        num = 4.5;
        //    }else if(SCREEN_HEIGHT > 568 && SCREEN_HEIGHT < 668){
        //        num = 4;
    }else {
        num = 4;
    }
    
    
    self.contentText = contentText;
    self.pageCount = (NSUInteger)(textView.contentSize.height / SCREEN_HEIGHT * num);
    return self.pageCount;
}

- (NSString *)stringOfPage:(NSUInteger)page {
    NSString *allText = self.contentText;
    NSInteger pageLength = allText.length / self.pageCount;
    if (page >= self.pageCount - 1) {
        return [allText substringFromIndex:pageLength * page];
    }
    NSRange r = {pageLength * page,pageLength};
    NSString *pageText = [allText substringWithRange:r];
    return pageText;
}


@end
