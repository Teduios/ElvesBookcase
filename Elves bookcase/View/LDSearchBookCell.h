//
//  LDSearchBookCell.h
//  Elves bookcase
//
//  Created by LD on 16/4/5.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDSearchBookCell : UITableViewCell
/** 图书封面 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 图书名字 */
@property (weak, nonatomic) IBOutlet UILabel *BookNameLabel;
/** 作者 */
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
/** 更新状态 */
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end
