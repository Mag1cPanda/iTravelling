//
//  LTSearchVC.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/29.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "LTSearchVC.h"
#import "LTTableViewCell.h"

@interface LTSearchVC ()<UISearchBarDelegate>
{
    UISearchBar *search;
}
@end

@implementation LTSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 30)];
    search.placeholder = @"搜索图集和游记";
    search.delegate = self;
    self.navigationItem.titleView = search;
    [self initTableView];
    
    [self.parameter setValue:@"1" forKey:@"currentPage"];
    [self.parameter setValue:@"1" forKey:@"queryType"];
    [self.parameter setValue:@"20" forKey:@"showcount"];
    [self.parameter setValue:self.tabType forKey:@"tabType"];
    [self.parameter setValue:@"cd9a268456314d23bc3aab93ffd3e3b0" forKey:@"userid"];
    
    UIButton *rightBtn = [UIButton new];
    rightBtn.frame = CGRectMake(0, 0, 40, 44);
    [rightBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn addTarget:self action:@selector(rightButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    UIButton *leftBtn = [UIButton new];
    leftBtn.frame = CGRectMake(0, 0, 40, 44);
    [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [leftBtn addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 取消和确认按钮点击事件
- (void)rightButtonClicked {
    if (search.text .length>0) {
        [self.parameter setValue:search.text forKey:@"title"];
        [self loadSearchData];
    }
    [search resignFirstResponder];
}

- (void)cancelButtonClicked {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)initTableView {
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
    self.table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataArray removeAllObjects];
        [self loadSearchData];
    }];
    [self.view addSubview:self.table];
    
    [self.table registerNib:[UINib nibWithNibName:@"LTTableViewCell" bundle:nil] forCellReuseIdentifier:@"LTTableViewCell"];
}

#pragma mark - 加载搜索数据
-(void)loadSearchData {
    
    NSLog(@"%@",self.parameter);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [SVProgressHUD showWithStatus:@"Loading"];
    
    [manager POST:LTSearchUrl parameters:self.parameter success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [SVProgressHUD dismiss];
        
        [self.table.mj_header endRefreshing];
        
        //        NSLog(@"%@",operation.responseString);
        NSString *jsonStr = operation.responseString;
        NSDictionary *bigDic = [Util dictionaryWithJsonString:jsonStr];
        NSArray *data = bigDic[@"data"];
        for (NSDictionary *dic in data) {
            TJModel *model = [[TJModel alloc] initWithDict:dic];
            [self.dataArray addObject:model];
        }
        
        self.delegate  = [[SRDelegate alloc] initWithCellHeight:200 HandleBlock:^(NSIndexPath *indexPath) {
            NSLog(@"%zi %zi",indexPath.section, indexPath.row);
//            TJModel *model = self.dataArray[indexPath.row];
        
        }];
        
        self.dataSource = [[SRDataSource alloc] initWithDataArray:self.dataArray sectionCount:1 cellIdentifier:@"LTTableViewCell" configureBlock:^(LTTableViewCell *cell, TJModel *model, NSIndexPath *indexPath) {
            cell.tjModel = model;
            cell.zjImg.hidden = YES;
            cell.zjLab.hidden = YES;
        }];
        
        self.table.delegate = self.delegate;
        self.table.dataSource = self.dataSource;
        
        [self.table  reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error.description);
        
    }];
}



#pragma mark - searchBar代理
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if (search.text .length>0) {
        [self.parameter setValue:search.text forKey:@"title"];
        [self loadSearchData];
    }
    [search resignFirstResponder];
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
