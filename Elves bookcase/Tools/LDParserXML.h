//
//  LDParserXML.h
//  Elves bookcase
//
//  Created by LD on 16/4/26.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDParserXML : NSObject

//解析xml数据
- (NSString *)parserXMLWithData:(NSData *)data;

@end
