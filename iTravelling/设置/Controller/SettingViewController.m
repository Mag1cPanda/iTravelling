//
//  SettingViewController.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/22.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "SettingViewController.h"
#import "CoolNavi.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W,SCREEN_H-49)
                                              style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    NSString *imgUrl = @"http://d.hiphotos.baidu.com/image/pic/item/0ff41bd5ad6eddc4f263b0fc3adbb6fd52663334.jpg";
    CoolNavi *headerView = [[CoolNavi alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)
                                            backGroudImage:@"noteBg_305x137_"
                                            headerImageURL:imgUrl
                                                     title:@"妹子!"
                                                  subTitle:@"身体和灵魂，总有一个在路上。"];
    headerView.scrollView = self.table;
    headerView.imgActionBlock = ^(){
        NSLog(@"headerImageAction");
    };
    [self.view addSubview:headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"test %zi",indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

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
