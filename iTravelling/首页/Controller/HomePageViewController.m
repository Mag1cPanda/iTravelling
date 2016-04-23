//
//  HomePageViewController.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/22.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "HomePageViewController.h"
#import "HPTableViewCell.h"
#import "HPModel.h"

@interface HomePageViewController ()
{
    SRDataSource *dataSource;
    SRDelegate *delegate;
    UITableView *table;
    NSMutableArray *dataArray;
}
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dataArray = [NSMutableArray array];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    //隐藏tabBar上面的横线
    for (UIView *view in self.tabBarController.tabBar.subviews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            view.hidden = YES;
        }
    }
    
    [self initTableView];
    
    [self loadHomePageData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - 初始化table
-(void)initTableView {
    
    table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    table.backgroundColor = [UIColor redColor];
    table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [dataArray removeAllObjects];
        [self loadHomePageData];
    }];
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"HPTableViewCell" bundle:nil] forCellReuseIdentifier:@"HPTableViewCell"];
}


#pragma mark - 加载首页数据
-(void)loadHomePageData {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
     manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:HomePageUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [table.mj_header endRefreshing];
        
        NSLog(@"%@",operation.responseString);
        
        NSDictionary *bigDic = [self dictionaryWithJsonString:operation.responseString];
        NSArray *infoArr = bigDic[@"info"];
        
        for (NSDictionary *dic in infoArr) {
            NSDictionary *extension = dic[@"extension"];
            if (!extension) {
                extension = dic[@"localTour"];
            }
            [dataArray addObject:extension];
        }
        
        delegate = [[SRDelegate alloc] initWithCellHeight:300];
        dataSource = [[SRDataSource alloc] initWithDataArray:dataArray sectionCount:1 cellIdentifier:@"HPTableViewCell" configureBlock:^(HPTableViewCell *cell, NSDictionary *dic) {
            cell.dic = dic;
        }];
        
        table.delegate = delegate;
        table.dataSource = dataSource;
        
        [table  reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error.description);
        
    }];
}

-(NSString*)objectToJson:(NSObject *)object {
    NSError *parseError = nil;
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
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
