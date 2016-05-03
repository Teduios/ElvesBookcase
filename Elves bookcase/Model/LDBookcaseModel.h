//
//  LDBookcaseModel.h
//  Elves bookcase
//
//  Created by LD on 16/4/13.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDBookcaseModel : NSObject

@property(nonatomic,strong)UIImage *iconImage;
@property(nonatomic,copy)NSString *bookAuthor;
@property(nonatomic,copy)NSString *bookName;
@property(nonatomic,copy)NSString *bookPath;

@end
