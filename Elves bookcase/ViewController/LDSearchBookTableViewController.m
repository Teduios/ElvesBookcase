//
//  LDSearchBookTableViewController.m
//  Elves bookcase
//
//  Created by LD on 16/4/5.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDSearchBookTableViewController.h"
#import "LDSearchBookCell.h"
#import "LDBookDetailsViewModel.h"
#import "LDBookDetailsViewController.h"

@interface LDSearchBookTableViewController ()<UISearchBarDelegate>

@property (nonatomic, strong)LDBookDetailsViewModel *bookDetailsVM;
@property (nonatomic, strong)NSDictionary *allBookID;
@property (weak, nonatomic) IBOutlet UIButton *searchBookBtn;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation LDSearchBookTableViewController

#pragma mark - 方法
- (IBAction)cancelBtn:(id)sender {
    //结束当前编辑状态 收起键盘
    [self.searchBar resignFirstResponder];
}
//点中搜索按键
- (IBAction)searchBookClick:(id)sender {
    //结束当前编辑状态 收起键盘
    [self.searchBar resignFirstResponder];
    //检查是否打开了网络
    LDDetectNetwork *network = [[LDDetectNetwork alloc]init];
    if (![network NetworkIsAvailable]) {
        [self.view showWarning:@"请打开网络后再试"];
        return;
    }
    //显示忙提示
    [self.view showBusyHUD];
    //通过bookID搜索书籍
    NSInteger bookID = [self.allBookID[self.searchBar.text] integerValue];
    WK(weakSelf)
    [self.bookDetailsVM getBookDetailsAndListWithBookID:bookID completionHandler:^(NSError *error) {
        
        if (error) {
            MYLog(@"error:%@",error);
            
        }else if (self.bookDetailsVM.bookName == nil) {
            [weakSelf.view showWarning:@"搜不到书籍"];
            return;
        }else {
            [weakSelf.tableView reloadData];
        }
        [weakSelf.view hideBusyHUD];
    }];
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchBookClick:self.searchBookBtn];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bookDetailsVM.bookName == nil ? 0 : 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LDSearchBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchBookCell" forIndexPath:indexPath];
    [cell.iconImageView setImageWithURL:[self.bookDetailsVM getIconURL] placeholder:[UIImage imageNamed:@"book_default_cover"]];
    cell.BookNameLabel.text = self.bookDetailsVM.bookName;
    cell.authorLabel.text = [NSString stringWithFormat:@"作者:%@",self.bookDetailsVM.booKAuthor];
    cell.tag = self.bookDetailsVM.bookID;
    
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
    LDBookDetailsViewController *BookDVC = segue.destinationViewController;
    [BookDVC setBookID:cell.tag];
}

#pragma mark - 懒加载
- (NSDictionary *)allBookID {
    if(_allBookID == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"AllBooksID" ofType:@"plist"];
        _allBookID = [NSDictionary dictionaryWithContentsOfFile:filePath];
    }
    return _allBookID;
}

- (LDBookDetailsViewModel *)bookDetailsVM {
    if(_bookDetailsVM == nil) {
        _bookDetailsVM = [[LDBookDetailsViewModel alloc] init];
    }
    return _bookDetailsVM;
}

@end
