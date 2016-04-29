//
//  LDBookstoreTableViewController.m
//  Elves bookcase
//
//  Created by LD on 16/4/5.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookstoreTableViewController.h"
#import "LDBookClassCell.h"
#import "LDBookListViewModel.h"
#import "LDBookDetailsViewController.h"

@interface LDBookstoreTableViewController ()

@property (nonatomic, strong) LDBookListViewModel *bookListVM;
@property(nonatomic,copy)NSString *categoryName;
@property(nonatomic,assign)NSInteger categoryID;

@end

@implementation LDBookstoreTableViewController

#pragma mark - 方法
- (void)setCategoryName:(NSString *)categoryName CategoryID:(NSInteger)categoryID {
    _categoryName = categoryName;
    _categoryID = categoryID;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.categoryName;
    
    WK(weakSelf)
    //添加头部刷新
    [self.tableView addHeaderRefresh:^{
        //获取图书列表
        [weakSelf.bookListVM getBookListListWithCategory:weakSelf.categoryID requestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            /*
             NSString *path = [[NSBundle mainBundle] pathForResource:@"AllBooksID.plist" ofType:nil];
             NSMutableDictionary *data = [NSMutableDictionary dictionary];
             
             for (NSInteger i = 0; i < self.bookListVM.rowNumber; i++) {
             [data setObject:[NSString stringWithFormat:@"%ld",[weakSelf.bookListVM getBookID:i]] forKey:[weakSelf.bookListVM bookNameForIndex:i]];
             }
             MYLog(@"%@",data);
             [data writeToFile:[[NSBundle mainBundle]pathForResource:@"AllBooksID.plist" ofType:nil] atomically:YES];
             */
            
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            }else {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    //一开始就刷新一次
    [self.tableView beginHeaderRefresh];
    //添加脚部返回刷新
    [self.tableView addBackFooterRefresh:^{
        //获取图书列表
        [weakSelf.bookListVM getBookListListWithCategory:weakSelf.categoryID requestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                [weakSelf.view showWarning:error.localizedDescription];
            }else {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endFooterRefresh];            
        }];
    }];
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
    return self.bookListVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LDBookClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookClassCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.iconImageView setImageWithURL:[self.bookListVM iconURLForIndex:row] placeholder:[UIImage imageNamed:@"book_default_cover"]];
    cell.bookNameLabel.text = [self.bookListVM bookNameForIndex:row];
    cell.bookDescriptionLabel.text = [self.bookListVM bookDescForIndex:row];
    cell.tag = [self.bookListVM getBookID:indexPath.row];
    
    return cell;
}

//点中某行执行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"goBookDetails" sender:indexPath];
}

//界面跳转时自动调用此方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender {
    //取出点中的cell
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:sender];
    //获取LDBookDetailsViewController控制器
    LDBookDetailsViewController *bookDVC = segue.destinationViewController;
    [bookDVC setBookID:cell.tag];
}

#pragma mark - 懒加载
- (LDBookListViewModel *)bookListVM {
    if(_bookListVM == nil) {
        _bookListVM = [[LDBookListViewModel alloc] init];
    }
    return _bookListVM;
}

@end
