//
//  LDBookDetailsViewController.m
//  Elves bookcase
//
//  Created by LD on 16/4/11.
//  Copyright © 2016年 LiDing. All rights reserved.
//

#import "LDBookDetailsViewController.h"
#import "LDBookDetailsViewModel.h"
#import "LDParserXML.h"

@interface LDBookDetailsViewController ()

@property (nonatomic, assign) NSInteger bookID;
@property (nonatomic, strong) LDBookDetailsViewModel *bookDetailsViewModel;
@property (weak, nonatomic) IBOutlet UITextView *bookDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *bookIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *readCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookClassLabel;
/** 下载图书 */
- (IBAction) downloadBookBtn:(UIButton *)sender;
@property (nonatomic, copy) NSString *bookFilePath;

@end

@implementation LDBookDetailsViewController

#pragma mark - 方法
//获取图书ID
- (void)setBookID:(NSInteger)bookID {
    _bookID = bookID;
}
//下载图书
- (IBAction)downloadBookBtn:(UIButton *)sender {
    //Documents目录
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //book文件夹目录
    self.bookFilePath = [NSString stringWithFormat:@"%@/ElvesBookcase/%@",documentsPath,self.bookDetailsViewModel.bookName];
    //book文件目录
    NSString *bookPath = [NSString stringWithFormat:@"%@/%@.txt",self.bookFilePath,self.bookDetailsViewModel.bookName];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:self.bookFilePath]) {
        //显示忙信息
        [self.view showBusyHUD];
        //创建book文件夹
        [fm createDirectoryAtPath:self.bookFilePath withIntermediateDirectories:YES attributes:nil error:nil];
        MYLog(@"测试1。。。。");
        if (![fm fileExistsAtPath:bookPath]) {
            //创建***.txt文件
            [fm createFileAtPath:bookPath contents:[self getBook] attributes:nil];
            MYLog(@"测试2。。。。");
        }
        //隐藏忙信息
        [self.view hideBusyHUD];
        sender.enabled = NO;
    }
    [self.view showWarning:@"下载已完成"];
}

//获取图书内容&&下载
- (NSMutableData *)getBook {
    NSInteger num = self.bookDetailsViewModel.bookDetailsList.count;
    NSInteger count = num - 1;
    NSMutableData *data = [NSMutableData data];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < num; i++) {
        //获取章节标题
        NSString *title = [NSString stringWithFormat:@"第%ld节:%@",i+1,self.bookDetailsViewModel.bookDetailsList[count].title];
        NSData *titleData = [title dataUsingEncoding:NSUTF8StringEncoding];
        //添加到data中
        [data appendData:titleData];
        
        //获取章节内容
        NSString *chapters = self.bookDetailsViewModel.bookDetailsList[count].message;
        NSData *chaptersData = [chapters dataUsingEncoding:NSUTF8StringEncoding];
        //创建LDParserXML工具类对象
        LDParserXML *parser = [[LDParserXML alloc]init];
        NSString *chapterStr = [parser parserXMLWithData:chaptersData];
        NSData *parserChapterData = [chapterStr dataUsingEncoding:NSUTF8StringEncoding];
        //添加到parserChapterData中
        [data appendData:parserChapterData];
        count--;
        
        //添加章节目录到字典中
        [dict setObject:title forKey:[NSString stringWithFormat:@"%ld",i]];
        MYLog(@"%@",dict);
    }
    //把dict字典写入plist文件存入沙盒中
    [dict setObject:self.bookDetailsViewModel.booKAuthor forKey:@"author"];
    NSString *plistPath = [NSString stringWithFormat:@"%@/%@.plist",self.bookFilePath,self.bookDetailsViewModel.bookName];
    [dict writeToFile:plistPath atomically:YES];
    
    //把image转换成data存入沙盒中
    UIImage *image = self.bookIconImageView.image;
    NSData *imageData = [NSData data];
    if (UIImagePNGRepresentation(image) == nil) {
        imageData = UIImageJPEGRepresentation(image, 1);
    } else {
        imageData = UIImagePNGRepresentation(image);
    }
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@.png",self.bookFilePath,self.bookDetailsViewModel.bookName];
    NSFileManager *fm = [NSFileManager defaultManager];
    [fm createFileAtPath:imagePath contents:imageData attributes:nil];
    
    return data;
}

//界面内容显示
- (void)show {
    //开始忙提示
    [self.view showBusyHUD];
    
    //获取图书详情并显示
    WK(weakSelf)
    [self.bookDetailsViewModel getBookDetailsAndListWithBookID:self.bookID completionHandler:^(NSError *error) {
        if (error) {
            [weakSelf.view showWarning:error.localizedDescription];
        }
        //获取图书类型字典
        NSDictionary *ditc = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"BookClass.plist" ofType:nil]];
        NSString *classStr = [NSString stringWithFormat:@"%ld",weakSelf.bookDetailsViewModel.bookClass];
        MYLog(@"%@",ditc[classStr]);
        //设置界面相关
        weakSelf.bookDescriptionTextView.text = weakSelf.bookDetailsViewModel.bookDesc;
        [weakSelf.bookIconImageView setImageWithURL:[weakSelf.bookDetailsViewModel getIconURL] placeholder:[UIImage imageNamed:@"book_default_cover"]];
        weakSelf.bookAuthorLabel.text = [NSString stringWithFormat:@"作者:%@",weakSelf.bookDetailsViewModel.booKAuthor];
        weakSelf.readCountLabel.text = [NSString stringWithFormat:@"阅读数:%@",weakSelf.bookDetailsViewModel.readCount];
        weakSelf.bookClassLabel.text = [NSString stringWithFormat:@"分类:%@",ditc[classStr]];
        weakSelf.navigationItem.title = weakSelf.bookDetailsViewModel.bookName;
        //关闭忙提示
        [weakSelf.view hideBusyHUD];
    }];
}


#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载
- (LDBookDetailsViewModel *)bookDetailsViewModel {
    if(_bookDetailsViewModel == nil) {
        _bookDetailsViewModel = [[LDBookDetailsViewModel alloc] init];
    }
    return _bookDetailsViewModel;
}


@end
