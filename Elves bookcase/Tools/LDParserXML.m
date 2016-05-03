//
//  LDParserXML.m
//  Elves bookcase
//
//  Created by LD on 16/4/26.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDParserXML.h"

@interface LDParserXML()<NSXMLParserDelegate>

@property (nonatomic, strong)NSMutableArray<NSMutableString *> *textStr;
@property (nonatomic, strong)NSMutableString *tempStr;
@property (nonatomic, strong)NSXMLParser *xmlParser;

@end

@implementation LDParserXML

- (NSString *)parserXMLWithData:(NSData *)data {
    self.xmlParser = [[NSXMLParser alloc]initWithData:data];
    self.xmlParser.delegate = self;
    [self.xmlParser parse];
    
    return self.textStr[0];
}

/* 开始解析xml文件，在开始解析xml节点前，通过该方法可以做一些初始化工作 */
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.textStr = nil;
    self.tempStr = nil;
    MYLog(@"开始解析xml文件");
}

/* 当解析器对象遇到xml的开始标记时，调用这个方法开始解析该节点 */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    MYLog(@"发现节点");
    if ([elementName isEqualToString:@"p"]) {
        if (self.textStr == nil) {
            self.textStr = [[NSMutableArray alloc]init];
        }
    }
}

/* 当解析器找到开始标记和结束标记之间的字符时，调用这个方法解析当前节点的所有字符 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    MYLog(@"正在解析节点内容");
    if (self.textStr == nil) {
        self.tempStr = [[NSMutableString alloc]init];
    }
    [self.tempStr appendString:string];
}

/* 当解析器对象遇到xml的结束标记时，调用这个方法完成解析该节点 */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    MYLog(@"解析节点结束");
    if ([elementName isEqualToString:@"p"]) {
        [self.textStr addObject:self.tempStr];
    }
}

/* 解析xml出错的处理方法 */
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    MYLog(@"解析xml出错:%@", parseError);
}

/* 解析xml文件结束 */
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    if (!self.tempStr) {
        self.tempStr = [[NSMutableString alloc] init];
    }
    MYLog(@"解析xml文件结束");
}

@end
