//
//  JourneyViewController.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/22.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "JourneyViewController.h"
#import "HMSegmentedControl.h"
#import "iCarousel.h"
#import "LTTableViewCell.h"
#import "ZJModel.h"
#import "TJModel.h"
#import "BannerModel.h"
#import "LTSearchVC.h"
#import "ZJDetailVC.h"
#import "TJDetailVC.h"
#import "YJDetailVC.h"
#import "SDCycleScrollView.h"
#import "LTHeaderView.h"

typedef void (^CompleteBlock)(NSString *jsonStr);

@interface JourneyViewController ()
<iCarouselDataSource,
iCarouselDelegate,
UITableViewDataSource,
UITableViewDelegate,
SDCycleScrollViewDelegate>

{
    UITableView *zjTable;
    UITableView *tjTable;
    UITableView *yjTable;
    
    NSMutableDictionary *zjBean;
    NSMutableDictionary *tjBean;
    NSMutableDictionary *yjBean;
    NSMutableDictionary *tjBannerBean;
    NSMutableDictionary *yjBannerBean;
    
    NSMutableArray *zjDataArr;
    NSMutableArray *tjDataArr;
    NSMutableArray *yjDataArr;
    NSMutableArray *tjBannerArr;
    NSMutableArray *yjBannerArr;
    
    NSTimer *timer;
    UIButton *btn;
    NSString *tabType;

    
}
@property (nonatomic, strong) HMSegmentedControl *segmentControl;
@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) LTHeaderView *tjHeader;
@property (nonatomic, strong) LTHeaderView *yjHeader;
@end

@implementation JourneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self initDictionaryAndArray];
    
    btn = [UIButton new];
    btn.frame = CGRectMake(0, 0, 40, 40);
    btn.hidden = YES;
    [btn setImage:[UIImage imageNamed:@"searchTitle_23x23_"] forState:0];
    [btn addTarget:self action:@selector(searchButtonClicked) forControlEvents:1 << 6];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
    [self initSegmentControlAndCarousel];
    
    [self initTableView];
    
    [SVProgressHUD showWithStatus:@"Loading"];
    
    [self loadDataWithUrl:FootMarkUrl parameters:zjBean complete:^(NSString *jsonStr) {
        
        [SVProgressHUD dismiss];
        
        NSDictionary *bigDic = [Util dictionaryWithJsonString:jsonStr];
        NSArray *data = bigDic[@"data"];
        for (NSDictionary *dic in data) {
            ZJModel *model = [[ZJModel alloc] initWithDict:dic];
            [zjDataArr addObject:model];
        }
        [zjTable reloadData];
        zjTable.hidden = NO;
    }];

}
#pragma mark - 搜索按钮点击事件
-(void)searchButtonClicked{
    
    LTSearchVC *vc = [LTSearchVC new];
    vc.hidesBottomBarWhenPushed = YES;
    vc.tabType = tabType;
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - 初始化字典和数组
-(void)initDictionaryAndArray{
    
    zjBean = [NSMutableDictionary dictionary];
    tjBean = [NSMutableDictionary dictionary];
    yjBean = [NSMutableDictionary dictionary];
    tjBannerBean = [NSMutableDictionary dictionary];
    yjBannerBean = [NSMutableDictionary dictionary];
    
    zjDataArr = [NSMutableArray array];
    tjDataArr = [NSMutableArray array];
    yjDataArr = [NSMutableArray array];
    tjBannerArr = [NSMutableArray array];
    yjBannerArr = [NSMutableArray array];
    
    [zjBean setValue:@"" forKey:@"address"];
    [zjBean setValue:@"1" forKey:@"queryType"];
    [zjBean setValue:@"1" forKey:@"currentPage"];
    [zjBean setValue:@"20" forKey:@"showcount"];
    [zjBean setValue:@"cd9a268456314d23bc3aab93ffd3e3b0" forKey:@"userid"];
    
    [tjBean setValue:@"" forKey:@"address"];
    [tjBean setValue:@"2" forKey:@"tabType"];
    [tjBean setValue:@"1" forKey:@"currentPage"];
    [tjBean setValue:@"20" forKey:@"showcount"];
    [tjBean setValue:@"cd9a268456314d23bc3aab93ffd3e3b0" forKey:@"userid"];
    
    [tjBannerBean setValue:@"2" forKey:@"tabType"];
    [tjBannerBean setValue:@"cd9a268456314d23bc3aab93ffd3e3b0" forKey:@"userid"];
    
    
    [yjBean setValue:@"" forKey:@"address"];
    [yjBean setValue:@"1" forKey:@"tabType"];
    [yjBean setValue:@"1" forKey:@"currentPage"];
    [yjBean setValue:@"20" forKey:@"showcount"];
    [yjBean setValue:@"cd9a268456314d23bc3aab93ffd3e3b0" forKey:@"userid"];
    
    [yjBannerBean setValue:@"1" forKey:@"tabType"];
    [yjBannerBean setValue:@"cd9a268456314d23bc3aab93ffd3e3b0" forKey:@"userid"];
}

#pragma mark - 初始化segmentControl和Carousel
-(void)initSegmentControlAndCarousel{
    
    _carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 104, SCREEN_W, SCREEN_H-64-48-40)];
    _carousel.dataSource = self;
    _carousel.delegate = self;
    _carousel.decelerationRate = 0.7;
    _carousel.type = iCarouselTypeLinear;
    _carousel.pagingEnabled = YES;
    _carousel.edgeRecognition = YES;
    //    _carousel.bounceDistance = 0.4;
    _carousel.bounces = NO;
    [self.view addSubview:_carousel];
    
    _segmentControl = [[HMSegmentedControl alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, 40)];
    _segmentControl.sectionTitles = @[@"足迹", @"图集", @"游记"];
    _segmentControl.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};
    _segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : SRRGBColor(0, 92, 255), NSFontAttributeName : [UIFont systemFontOfSize:16]};
    _segmentControl.selectionIndicatorColor = SRRGBColor(0, 92, 255);
    _segmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    _segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentControl.selectionIndicatorHeight = 2.0;
    [self.view addSubview:_segmentControl];
    
    __weak typeof(self) weakSelf = self;
    
    [self.segmentControl setIndexChangeBlock:^(NSInteger index) {
        
        [weakSelf.carousel scrollToItemAtIndex:index animated:NO];
        
    }];
}

#pragma mark - 初始化tableView
-(void)initTableView{
    zjTable = [[UITableView alloc] initWithFrame:_carousel.bounds style:UITableViewStylePlain];
    zjTable.delegate = self;
    zjTable.dataSource = self;
    zjTable.allowsSelection = NO;
    zjTable.hidden = YES;
    [zjTable registerNib:[UINib nibWithNibName:@"LTTableViewCell" bundle:nil] forCellReuseIdentifier:@"LTTableViewCell"];
    
    tjTable = [[UITableView alloc] initWithFrame:_carousel.bounds style:UITableViewStylePlain];
    tjTable.delegate = self;
    tjTable.dataSource = self;
    tjTable.allowsSelection = NO;
    tjTable.hidden = YES;
    [tjTable registerNib:[UINib nibWithNibName:@"LTTableViewCell" bundle:nil] forCellReuseIdentifier:@"LTTableViewCell"];
    _tjHeader = [[LTHeaderView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_W, 220)];
    tjTable.tableHeaderView = _tjHeader;
    
    yjTable = [[UITableView alloc] initWithFrame:_carousel.bounds style:UITableViewStylePlain];
    yjTable.delegate = self;
    yjTable.dataSource = self;
    yjTable.allowsSelection = NO;
    yjTable.hidden = YES;
    [yjTable registerNib:[UINib nibWithNibName:@"LTTableViewCell" bundle:nil] forCellReuseIdentifier:@"LTTableViewCell"];
    _yjHeader = [[LTHeaderView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_W, 200)];
    yjTable.tableHeaderView = _yjHeader;
}

#pragma mark - 按钮点击事件
-(void)newbtnClicked{
    NSLog(@"最新Click");
}

#pragma mark - 加载数据
-(void)loadDataWithUrl:(NSString *)url parameters:(NSMutableDictionary *)para complete:(CompleteBlock)block{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:para success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSString *jsonStr = operation.responseString;
        
        if (block) {
            block(jsonStr);
        }
    
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error.description);
        
    }];
}

#pragma mark - iCarousel的代理方法
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 3;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    if (index == 0 ) {
        view = zjTable;
    }
    else if (index == 1){
        view = tjTable;
    }
    else if (index == 2){
        view = yjTable;
    }
    
    return view;
}

-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    [_segmentControl setSelectedSegmentIndex:carousel.currentItemIndex animated:YES];
    
    if (carousel.currentItemIndex == 0) {
        btn.hidden = YES;
        if (zjDataArr.count == 0) {
            
            [SVProgressHUD showWithStatus:@"Loading"];
            
            [self loadDataWithUrl:FootMarkUrl parameters:zjBean complete:^(NSString *jsonStr) {
                [SVProgressHUD dismiss];
                NSDictionary *bigDic = [Util dictionaryWithJsonString:jsonStr];
                NSArray *data = bigDic[@"data"];
                for (NSDictionary *dic in data) {
                    ZJModel *model = [[ZJModel alloc] initWithDict:dic];
                    [zjDataArr addObject:model];
                }
                [zjTable reloadData];
            }];
        }
    }
    
    else if (carousel.currentItemIndex == 1) {
        btn.hidden = NO;
        tabType = @"2";
        if (tjDataArr.count == 0) {
            
            [SVProgressHUD showWithStatus:@"Loading"];
            
            [self loadDataWithUrl:PhotoSetsUrl parameters:tjBean complete:^(NSString *jsonStr) {
                
                [SVProgressHUD dismiss];
                
                NSDictionary *bigDic = [Util dictionaryWithJsonString:jsonStr];
                NSArray *data = bigDic[@"data"];
                for (NSDictionary *dic in data) {
                    TJModel *model = [[TJModel alloc] initWithDict:dic];
                    [tjDataArr addObject:model];
                }
                [tjTable reloadData];
                tjTable.hidden = NO;
            }];
        }
    
        if (tjBannerArr.count == 0) {
            
            [self loadDataWithUrl:PSBannerUrl parameters:tjBannerBean complete:^(NSString *jsonStr) {
                
                NSDictionary *bigDic = [Util dictionaryWithJsonString:jsonStr];
                NSDictionary *data = bigDic[@"data"];
                NSArray *extData = data[@"extData"];
                
                NSMutableArray *imgAry = [NSMutableArray array];
                for (NSDictionary *dic in extData) {
                    BannerModel *model = [[BannerModel alloc] initWithDict:dic];
                    [tjBannerArr addObject:model];
                    
                    NSString *imgUrl = [NSString stringWithFormat:@"%@%@",LTIMgPrefix,model.article_faceimg];
                    [imgAry addObject:imgUrl];
                    
                }
                _tjHeader.cycleScroll.imageURLStringsGroup = imgAry;
            }];
        }
    }
    
    else if (carousel.currentItemIndex == 2) {
        btn.hidden = NO;
        tabType = @"1";
        if (yjDataArr.count == 0) {
            
            [SVProgressHUD showWithStatus:@"Loading"];
            
            [self loadDataWithUrl:TravelNotesUrl parameters:yjBean complete:^(NSString *jsonStr) {
                
                [SVProgressHUD dismiss];
                
                NSDictionary *bigDic = [Util dictionaryWithJsonString:jsonStr];
                NSArray *data = bigDic[@"data"];
                
                for (NSDictionary *dic in data) {
                    TJModel *model = [[TJModel alloc] initWithDict:dic];
                    [yjDataArr addObject:model];
                }
                
                [yjTable reloadData];
                yjTable.hidden = NO;
            }];
        }

        if (yjBannerArr.count == 0) {
            [self loadDataWithUrl:TNBannerUrl parameters:yjBannerBean complete:^(NSString *jsonStr) {
                
                NSDictionary *bigDic = [Util dictionaryWithJsonString:jsonStr];
                NSDictionary *data = bigDic[@"data"];
                NSArray *extData = data[@"extData"];
                
                NSMutableArray *imgAry = [NSMutableArray array];
                for (NSDictionary *dic in extData) {
                    BannerModel *model = [[BannerModel alloc] initWithDict:dic];
                    [yjBannerArr addObject:model];
                    
                    NSString *imgUrl = [NSString stringWithFormat:@"%@%@",LTIMgPrefix,model.article_faceimg];
                    [imgAry addObject:imgUrl];
                }
                _yjHeader.cycleScroll.imageURLStringsGroup = imgAry;
            }];
        }
    }
}

#pragma mark - tableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == zjTable) {
        return zjDataArr.count;
    }
    else if (tableView == tjTable){
        return tjDataArr.count;
    }
    else {
        return yjDataArr.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LTTableViewCell"];
    if (tableView == zjTable) {
        if (zjDataArr.count > indexPath.row) {
            cell.isFootMark = YES;
            ZJModel *model = zjDataArr[indexPath.row];
            cell.zjModel = model;
        }
    }
    else if (tableView == tjTable){
        if (tjDataArr.count > indexPath.row) {
            cell.isFootMark = NO;
            TJModel *model = tjDataArr[indexPath.row];
            NSLog(@"%@",model);
            cell.tjModel = model;
        }
    }
    else {
        if (yjDataArr.count > indexPath.row) {
            cell.isFootMark = NO;
            TJModel *model = yjDataArr[indexPath.row];
            cell.tjModel = model;
        }
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == zjTable) {
        ZJDetailVC *vc = [ZJDetailVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (tableView == tjTable){
        TJDetailVC *vc = [TJDetailVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    
    }
    else{
        YJDetailVC *vc = [YJDetailVC new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
