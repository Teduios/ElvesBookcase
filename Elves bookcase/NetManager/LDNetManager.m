//
//  LDNetManager.m
//  Elves bookcase
//
//  Created by LD on 16/4/7.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDNetManager.h"

@implementation LDNetManager

+ (void)getBookListWithCategory:(NSInteger)categoryID page:(NSInteger)page completionHandler:(void (^)(LDBookListModel *, NSError *))completionHandler {
    //    NSString *path = [NSString stringWithFormat:@"http://www.tngou.net/api/book/list?id=%ld&rows=10000000&page=%ld",categoryID,page];
    NSString *path = [NSString stringWithFormat:@"http://www.tngou.net/api/book/list?id=%ld&rows=10&page=%ld",categoryID,page];
    [self GET:path parameters:nil progress:nil completionHandler:^(id model, NSError *error) {
        completionHandler([LDBookListModel parseJSON:model], error);
    }];
}

+ (void)getBookDetailsWithBookList:(NSInteger)BookID completionHandler:(void (^)(LDBookDetailsModel *, NSError *))completionHandler {
    NSString *path = [NSString stringWithFormat:@"http://www.tngou.net/api/book/show?id=%ld",BookID];
    
    [self GET:path parameters:nil progress:nil completionHandler:^(id model, NSError *error) {
        completionHandler([LDBookDetailsModel parseJSON:model], error);
    }];
}

@end
