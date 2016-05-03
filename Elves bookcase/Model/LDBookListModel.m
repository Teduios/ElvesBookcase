//
//  LDBookListModel.m
//  Elves bookcase
//
//  Created by LD on 16/4/6.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookListModel.h"

@implementation LDBookListModel

+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"totalPage" :  @"totalpage"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"list": [LDBookListListModel class]};
}

@end

@implementation LDBookListListModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{
             @"ID" : @"id",
             @"bookClass" : @"bookclass"
             };
}

@end


