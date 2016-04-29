//
//  LDBookcaseViewModel.m
//  Elves bookcase
//
//  Created by LD on 16/4/13.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookcaseViewModel.h"

@implementation LDBookcaseViewModel

- (UIImage *)iconImageForIndex:(NSInteger)index {
    return self.allBook[index].iconImage;
}

- (NSString *)bookAuthorForIndex:(NSInteger)index {
    return self.allBook[index].bookAuthor;
}

- (NSString *)bookNameForIndex:(NSInteger)index {
    return self.allBook[index].bookName;
}

- (NSMutableArray<LDBookcaseModel *> *)allBook {
    if (!_allBook) {
        _allBook = [[NSMutableArray alloc]init];
    }
    return _allBook;
}

- (void)getAllBook {
    NSString *ducumentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *ElvesBookcasePath = [ducumentsPath stringByAppendingPathComponent:@"ElvesBookcase"];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:ElvesBookcasePath error:nil];
    for (NSInteger i = 0; i < fileNames.count; i++) {
        LDBookcaseModel *bookcase = [[LDBookcaseModel alloc]init];
        //书籍文件夹路径
        NSString *bookFilePath = [ElvesBookcasePath stringByAppendingPathComponent:fileNames[i]];
        //plist文件路径
        NSString *bookPlistPath = [NSString stringWithFormat:@"%@/%@.plist",bookFilePath,fileNames[i]];
        NSData *plistData = [NSData dataWithContentsOfFile:bookPlistPath];
        NSDictionary *dict = [NSDictionary dictionaryWithPlistData:plistData];
        //iconImage文件路径
        NSString *bookImagePath = [NSString stringWithFormat:@"%@/%@.png",bookFilePath,fileNames[i]];
        //book文件路径
        NSString *bookPath = [NSString stringWithFormat:@"%@/%@.txt",bookFilePath,fileNames[i]];
        //给bookcase对象赋值
        bookcase.iconImage = [UIImage imageWithContentsOfFile:bookImagePath];
        bookcase.bookName = fileNames[i];
        bookcase.bookAuthor = dict[@"author"];
        bookcase.bookPath = bookPath;
        //添加到allBook数组中
        [self.allBook addObject:bookcase];
    }
}


@end
