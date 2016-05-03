//
//  LDBookcaseCell.h
//  Elves bookcase
//
//  Created by LD on 16/4/8.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDBookcaseCell : UITableViewCell
/** 图书封面 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 图书名字 */
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
/** 作者 */
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@end
