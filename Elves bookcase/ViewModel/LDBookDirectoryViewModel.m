//
//  LDBookDirectoryViewModel.m
//  Elves bookcase
//
//  Created by LD on 16/4/19.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookDirectoryViewModel.h"

@implementation LDBookDirectoryViewModel

- (NSString *)bookDirectoryForIndex:(NSInteger)index {
    return self.allBookDirectory[index];
}

- (NSMutableArray<NSString *> *)allBookDirectory {
    if (!_allBookDirectory) {
        _allBookDirectory = [NSMutableArray array];
    }
    return _allBookDirectory;
}

- (void)getAllBookDirectoryWithBookName:(NSString *)bookName {
    //Documents目录
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //book文件夹目录
    NSString *bookFilePath = [NSString stringWithFormat:@"%@/ElvesBookcase/%@",documentsPath,bookName];
    //plist文件目录
    NSString *plistPath = [NSString stringWithFormat:@"%@/%@.plist",bookFilePath,bookName];
    
    NSData *plistData = [NSData dataWithContentsOfFile:plistPath];
    NSDictionary *plistDic = [NSDictionary dictionaryWithPlistData:plistData];
    NSInteger i = 0;
    while (1) {
        NSString *num = [NSString stringWithFormat:@"%ld",(long)i];
        if (plistDic[num] == nil) {
            break;
        }
        [self.allBookDirectory addObject:plistDic[num]];
        i++;
    }
}

@end
