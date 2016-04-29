//
//  LDBookClassCell.h
//  Elves bookcase
//
//  Created by LD on 16/4/8.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDBookClassCell : UITableViewCell
/** 图书封面 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 图书名字 */
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
/** 图书简介 */
@property (weak, nonatomic) IBOutlet UILabel *bookDescriptionLabel;


@end
