//
//  NSObject+LDNetWorking.h
//  Elves bookcase
//
//  Created by LD on 16/4/7.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionHandler)(id model, NSError *error);

@interface NSObject (LDNetWorking)

//GET请求
+ (id)GET:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(CompletionHandler)completionHandler;
//POST请求
+ (id)POST:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(CompletionHandler)completionHandler;


@end
