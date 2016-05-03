//
//  LDBookClassTableViewController.m
//  Elves bookcase
//
//  Created by LD on 16/4/8.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookClassTableViewController.h"
#import "LDBookstoreTableViewController.h"

@interface LDBookClassTableViewController ()

@end

@implementation LDBookClassTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_HEIGHT / 13;
}


//点中某行执行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
<<<<<<< HEAD
    //检查是否打开了网络
    LDDetectNetwork *network = [[LDDetectNetwork alloc]init];
    if (![network NetworkIsAvailable]) {
        [self.view showWarning:@"请打开网络后再试"];
        return;
    }
    
=======
>>>>>>> c4602e229b093ca6941f64069653cd1757a4969c
    [self performSegueWithIdentifier:@"goBookstore" sender:indexPath];
}

//界面跳转自动调用  sender 是36行代码最后一个参数传入过来的
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    //取出点中的cell
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:sender];
    //获取Bookstore控制器
    LDBookstoreTableViewController *bookstoreVC = segue.destinationViewController;
    [bookstoreVC setCategoryName:cell.textLabel.text CategoryID:cell.tag];
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

@end
