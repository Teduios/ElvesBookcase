//
//  LDBookcaseViewModel.m
//  Elves bookcase
//
//  Created by LD on 16/4/7.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookListViewModel.h"

@implementation LDBookListViewModel

- (NSInteger)rowNumber {
    return self.bookList.count;
}

- (NSURL *)iconURLForIndex:(NSInteger)index {
    NSString *imageurl = [NSString stringWithFormat:@"http://tnfs.tngou.net/image%@",[self.bookList[index] img]];
    return [NSURL URLWithString:imageurl];
}

- (NSString *)bookNameForIndex:(NSInteger)index {
    return self.bookList[index].name;
}

- (NSString *)booKAuthorIndex:(NSInteger)index {
    return self.bookList[index].author;
}

- (NSString *)bookDescForIndex:(NSInteger)index {
    return self.bookList[index].summary;
}

- (NSMutableArray<LDBookListListModel *> *)bookList {
    if (!_bookList) {
        _bookList = [NSMutableArray array];
    }
    return _bookList;
}

- (NSInteger)getBookID:(NSInteger)index {
    return self.bookList[index].ID;
}

- (void)getBookListListWithCategory:(NSInteger)categoryID requestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpage = 1;
    if (requestMode == RequestModeMore) {
        tmpage = _page + 1;
    }
    [LDNetManager getBookListWithCategory:categoryID page:tmpage completionHandler:^(LDBookListModel *model, NSError *error) {
        if (!error) {
            _page = tmpage;
            if (requestMode == RequestModeRefresh) {
                [self.bookList removeAllObjects];
            }
            [self.bookList addObjectsFromArray:model.list];
        }
        completionHandler(error);
    }];
}



@end
