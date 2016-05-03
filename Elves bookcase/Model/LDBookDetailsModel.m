//
//  LDBookDetailsModel.m
//  Elves bookcase
//
//  Created by LD on 16/4/6.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookDetailsModel.h"

@implementation LDBookDetailsModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"bookClass" :  @"bookclass",
             @"ID" : @"id"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"list": [LDBookDetailsListModel class]};
}

@end

@implementation LDBookDetailsListModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{@"ID" : @"id"
             };
}
@end


