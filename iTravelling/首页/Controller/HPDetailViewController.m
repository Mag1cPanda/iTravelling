//
//  HPDetailViewController.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/23.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "HPDetailViewController.h"
#import <WebKit/WebKit.h>
#import "HPDetailCell.h"
#import "HPSecondViewController.h"

@interface HPDetailViewController ()
{
    WKWebView *webView;

}
@end

@implementation HPDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if (self.dic[@"url"]) {
        webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:webView];
    
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.dic[@"url"]]];
        [webView loadRequest:request];
    }
    else {
        NSLog(@"%@",self.dic[@"keyword"]);
        
        [self initTableView];
        
        [self.parameter setValue:self.dic[@"keyword"] forKey:@"keyword"];
        [self.parameter setValue:@"10" forKey:@"number"];
        [self.parameter setValue:@"1" forKey:@"page"];
        
        [self loadLocalTourDataWithPara:self.parameter];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化table
-(void)initTableView {
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataArray removeAllObjects];
        [self loadLocalTourDataWithPara:self.parameter];
    }];
    [self.view addSubview:self.table];
    
    [self.table registerNib:[UINib nibWithNibName:@"HPDetailCell" bundle:nil] forCellReuseIdentifier:@"HPDetailCell"];
}

#pragma mark - loadLocalTourData
-(void)loadLocalTourDataWithPara:(NSMutableDictionary *)para{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [SVProgressHUD showWithStatus:@"Loading"];
    
    [manager GET:LocalTourUrl parameters:para success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [SVProgressHUD dismiss];
        
        [self.table.mj_header endRefreshing];
        
//        NSLog(@"%@",operation.responseString);
        
        NSDictionary *bigDic = [Util dictionaryWithJsonString:operation.responseString];
        NSDictionary *infoDic = bigDic[@"info"];
        NSArray *listArr = infoDic[@"list"];
        for (NSDictionary *dic in listArr) {
            [self.dataArray addObject:dic];
        }
        
        self.delegate  = [[SRDelegate alloc] initWithCellHeight:250 HandleBlock:^(NSIndexPath *indexPath) {
            
            NSLog(@"%zi %zi",indexPath.section, indexPath.row);
            NSDictionary *dic = self.dataArray[indexPath.row];
            HPSecondViewController *vc = [HPSecondViewController new];
            vc.dic =  dic;
            [self.navigationController pushViewController:vc animated:YES];
            
        }];
        self.dataSource = [[SRDataSource alloc] initWithDataArray:self.dataArray sectionCount:1 cellIdentifier:@"HPDetailCell" configureBlock:^(HPDetailCell *cell, NSDictionary *dic, NSIndexPath *indexPath) {
            
            cell.dic = dic;
       
        }];
        self.table.emptyDataSetDelegate = self.delegate;
        self.table.emptyDataSetSource = self.dataSource;
        self.table.delegate = self.delegate;
        self.table.dataSource = self.dataSource;
        
        [self.table  reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error.description);
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
