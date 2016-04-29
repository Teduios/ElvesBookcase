//
//  NSObject+LDNetWorking.m
//  Elves bookcase
//
//  Created by LD on 16/4/7.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "NSObject+LDNetWorking.h"

#define kTimeoutInterval 30

@implementation NSObject (LDNetWorking)

+ (id)GET:(NSString *)path parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(CompletionHandler)completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //让AF接受除了JSON以外的数据类型:
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", nil];
    //请求超时时间
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil,error);
        NSLog(@"error %@", error);
    }];
}

+ (id)POST:(NSString *)path parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(CompletionHandler)completionHandler {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //让AF接受除了JSON以外的数据类型:
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", nil];
    //请求超时时间
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    
    return [manager POST:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil,error);
        NSLog(@"error %@", error);
    }];
}

@end
