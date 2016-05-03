//
//  LDBookDetailsViewModel.m
//  Elves bookcase
//
//  Created by LD on 16/4/12.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookDetailsViewModel.h"
#import "LDNetManager.h"

@implementation LDBookDetailsViewModel

- (NSString *)bookName {
    return self.bookDetails.name;
}

- (NSString *)booKAuthor {
    return self.bookDetails.author;
}

- (NSString *)bookDesc {
    return self.bookDetails.summary;
}

- (NSString *)readCount {
    return self.bookDetails.count;
}

- (NSInteger)bookClass {
    return self.bookDetails.bookClass;
}

- (NSURL *)getIconURL {
    NSString *imageurl = [NSString stringWithFormat:@"http://tnfs.tngou.net/image%@",self.bookDetails.img];
    return [NSURL URLWithString:imageurl];
}

- (NSInteger)bookID {
    return self.bookDetails.ID;
}

- (LDBookDetailsModel *)bookDetails {
    if (!_bookDetails) {
        _bookDetails = [[LDBookDetailsModel alloc]init];
    }
    return _bookDetails;
}

- (NSMutableArray<LDBookDetailsListModel *> *)bookDetailsList {
    if (!_bookDetailsList) {
        _bookDetailsList = [NSMutableArray array];
    }
    return _bookDetailsList;
}

- (void)getBookDetailsAndListWithBookID:(NSInteger)bookID completionHandler:(void (^)(NSError *))completionHandler {
    [LDNetManager getBookDetailsWithBookList:bookID completionHandler:^(LDBookDetailsModel *model, NSError *error) {
        if (!error) {
            self.bookDetails = model;
            [self.bookDetailsList addObjectsFromArray:model.list];
        }
        completionHandler(error);
    }];
}

@end
