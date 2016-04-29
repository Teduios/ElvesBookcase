//
//  NSObject+LDParse.m
//  Elves bookcase
//
//  Created by LD on 16/4/7.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "NSObject+LDParse.h"

@implementation NSObject (LDParse)

- (NSString *)description {
    return [self modelDescription];
}

+ (id)parseJSON:(id)json {
    if([json isKindOfClass:[NSDictionary class]]){
        return [self modelWithJSON:json];
    }
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:json];
    }
    return json;
}

@end
