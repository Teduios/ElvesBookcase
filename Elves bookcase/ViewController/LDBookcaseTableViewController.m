//
//  LD_BookcaseTableViewController.m
//  Elves bookcase
//
//  Created by LD on 16/3/28.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookcaseTableViewController.h"
#import "LDBookcaseViewModel.h"
#import "LDBookcaseCell.h"
#import "LDReadMainViewController.h"
#import "LDPageContentViewController.h"

@interface LDBookcaseTableViewController ()
@property (nonatomic, strong)LDBookcaseViewModel *bookcaseVM;

@end

@implementation LDBookcaseTableViewController

#pragma mark - 方法
//管理、编辑书籍
- (IBAction)editBarBtnItem:(UIBarButtonItem *)sender {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    [sender setTitle:self.tableView.isEditing ? @"完成" : @"管理"];
}



#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    LDBookcaseViewModel *bookcaseVM = [[LDBookcaseViewModel alloc]init];
    [bookcaseVM getAllBook];
    self.bookcaseVM = bookcaseVM;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bookcaseVM.allBook.count;
}

//每行cell显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LDBookcaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookcaseCell" forIndexPath:indexPath];
    cell.iconImageView.image = [self.bookcaseVM iconImageForIndex:indexPath.row];
    cell.bookNameLabel.text = [self.bookcaseVM bookNameForIndex:indexPath.row];
    cell.authorLabel.text = [self.bookcaseVM bookAuthorForIndex:indexPath.row];
    
    return cell;
}
//编辑状态下执行
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除沙盒中的文件
        NSFileManager *fm = [NSFileManager defaultManager];
        NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *filePath = [NSString stringWithFormat:@"%@/ElvesBookcase/%@",documentPath,[self.bookcaseVM bookNameForIndex:indexPath.row]];
        NSError *err;
        [fm removeItemAtPath:filePath error:&err];
        //删除偏好设置中的相关设置
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:[self.bookcaseVM bookNameForIndex:indexPath.row]];
        //删除数组中的元素
        [self.bookcaseVM.allBook removeObjectAtIndex:indexPath.row];
        //删除Cell
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

//更改 delete 为 删除
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"goRead" sender:indexPath];   
}

//界面跳转时自动调用此方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    //取出点中的cell
    LDBookcaseCell *cell = [self.tableView cellForRowAtIndexPath:sender];
    
    LDReadMainViewController *readMVC = segue.destinationViewController;
    [readMVC getBookName:cell.bookNameLabel.text];
}

@end
