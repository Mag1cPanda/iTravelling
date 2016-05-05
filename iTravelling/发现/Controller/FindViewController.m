//
//  FindViewController.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/22.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableViewCell.h"
#import "FindDetailViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
    
    [self loadFindData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化table
-(void)initTableView {
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
    self.table.hidden = YES;
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataArray removeAllObjects];
        [self loadFindData];
    }];
    [self.view addSubview:self.table];
    
    [self.table registerNib:[UINib nibWithNibName:@"FindTableViewCell" bundle:nil] forCellReuseIdentifier:@"FindTableViewCell"];
    
}


#pragma mark - 加载首页数据
-(void)loadFindData {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [SVProgressHUD showWithStatus:@"Loading"];
    
    [manager GET:FindUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [SVProgressHUD dismiss];
        
        [self.table.mj_header endRefreshing];
        
        NSDictionary *bigDic = [Util dictionaryWithJsonString:operation.responseString];
        NSArray *infoArr = bigDic[@"info"];
        
        for (NSDictionary *dic in infoArr) {
            [self.dataArray addObject:dic];
        }
        
        self.delegate  = [[SRDelegate alloc] initWithCellHeight:200 HandleBlock:^(NSIndexPath *indexPath) {
            NSLog(@"%zi %zi",indexPath.section, indexPath.row);
            NSDictionary *dic = self.dataArray[indexPath.row];
            FindDetailViewController *vc = [FindDetailViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            vc.dic = dic;
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
        self.dataSource = [[SRDataSource alloc] initWithDataArray:self.dataArray sectionCount:1 cellIdentifier:@"FindTableViewCell" configureBlock:^(FindTableViewCell *cell, NSDictionary *dic, NSIndexPath *indexPath) {
            cell.dic = dic;
        }];
        
        self.table.delegate = self.delegate;
        self.table.dataSource = self.dataSource;
        self.table.hidden = NO;
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
