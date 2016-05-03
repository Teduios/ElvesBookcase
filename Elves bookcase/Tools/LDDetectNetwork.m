//
//  LDDetectNetwork.m
//  Elves bookcase
//
//  Created by LD on 16/4/27.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDDetectNetwork.h"
#import "Reachability.h"

@implementation LDDetectNetwork

- (BOOL)NetworkIsAvailable {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    switch (status) {
        case NotReachable:
            return NO;
        case ReachableViaWiFi:
            return YES;
        case ReachableViaWWAN:
            return YES;
        default:
            return NO;
    }
}

@end
