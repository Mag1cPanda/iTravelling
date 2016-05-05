//
//  SearchViewController.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/22.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchHotCell.h"
#import "LeftTableViewCell.h"
#import "CountryCell.h"
#import "SEDetailViewController.h"

@interface SearchViewController ()
<UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource,
UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate,
UISearchBarDelegate>
{
    UISearchBar *search;
    UICollectionView *collection;
    UITableView *countryTable;
    NSArray *countryArr;
    
    NSArray *imgArr;
    NSArray *tableImgArr;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 30)];
    search.placeholder = @"搜索国家和地区";
    self.navigationItem.titleView = search;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    imgArr = @[@"manguhot",
               @"fahot",
               @"qingmanhot",
               @"batiyahot",
               @"aodilihot",
               @"usahot",
               @"germhot",
               @"pujihot",
               @"maoqiuhot",
               @"intalhot"];
    
    tableImgArr = @[@"hotButton",
                    @"eourpon",
                    @"meizhou",
                    @"feizhou",
                    @"dayangzhou",
                    @"yazhou"];
    
    [self initLeftTable];
    
    [self initCountryTable];
    
    [self initCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [search resignFirstResponder];
}

#pragma mark - 初始化tableView
-(void)initLeftTable{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 60, SCREEN_H-64-48) style:UITableViewStylePlain];
    self.table.backgroundColor = SRRGBColor(242, 242, 242);
    self.table.scrollEnabled = NO;
    [self.view addSubview:self.table];
    
    [self.table registerNib:[UINib nibWithNibName:@"LeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"LeftTableViewCell"];
    
    
    self.delegate = [[SRDelegate alloc] initWithCellHeight:70 didSelectRow:^(NSIndexPath *indexPath) {
        
        NSLog(@"%zi",indexPath.row);
        LeftTableViewCell *cell = [self.table cellForRowAtIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor whiteColor];
        
        if (indexPath.row != 0) {
            collection.hidden = YES;
            countryTable.hidden = NO;
        }
        else {
            collection.hidden = NO;
            countryTable.hidden = YES;
        }
        
        if (indexPath.row == 1) {
            [self loadDataFromTxtNamed:@"ozhou"];
        }
        
        if (indexPath.row == 2) {
            [self loadDataFromTxtNamed:@"meizhou"];
        }
        
        if (indexPath.row == 3) {
            [self loadDataFromTxtNamed:@"feizhou"];
        }
        
        if (indexPath.row == 4) {
            [self loadDataFromTxtNamed:@"dayangzhou"];
        }
        
        if (indexPath.row == 5) {
            [self loadDataFromTxtNamed:@"yazhou"];
        }
        
    } didDeSelectRow:^(NSIndexPath *indexPath) {
        
        LeftTableViewCell *cell = [self.table cellForRowAtIndexPath:indexPath];
        cell.contentView.backgroundColor = SRRGBColor(242, 242, 242);
        
    }];
    
    self.dataSource = [[SRDataSource alloc] initWithDataArray:tableImgArr sectionCount:1 cellIdentifier:@"LeftTableViewCell" configureBlock:^(LeftTableViewCell *cell, NSString *imgName, NSIndexPath *indexPath) {
        cell.imageV.image = [UIImage imageNamed:imgName];
    }];
    
    self.table.delegate = self.delegate;
    self.table.dataSource = self.dataSource;
    
}

-(void)loadDataFromTxtNamed:(NSString *)name{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
    
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *arr = [str componentsSeparatedByString:@"\n"];
    
    countryArr = arr;
    
    [countryTable reloadData];
}

#pragma mark - 初始化国家和地区table
-(void)initCountryTable{
    
    countryTable = [[UITableView alloc] initWithFrame:CGRectMake(70, 64, SCREEN_W-90, SCREEN_H-64-48) style:UITableViewStylePlain];
    countryTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    countryTable.showsVerticalScrollIndicator = NO;
    [self.view addSubview:countryTable];
    
    [countryTable registerNib:[UINib nibWithNibName:@"CountryCell" bundle:nil] forCellReuseIdentifier:@"CountryCell"];
    
    countryTable.delegate = self;
    countryTable.dataSource = self;
}



#pragma mark - 初始化collectionView
-(void)initCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc ] init];
    //设置单元格的大小
    CGFloat cellWidth = (SCREEN_W-130)/2;
    layout.itemSize = CGSizeMake(cellWidth,cellWidth);
    
    //设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collection = [[UICollectionView alloc] initWithFrame:CGRectMake(70, 64, SCREEN_W-90, SCREEN_H-64-48) collectionViewLayout:layout];
    collection.backgroundColor = [UIColor whiteColor];
    collection.delegate = self;
    collection.dataSource = self;
    collection.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:collection];
    
    [collection registerNib:[UINib nibWithNibName:@"SearchHotCell" bundle:nil] forCellWithReuseIdentifier:@"SearchHotCell"];
 
}

#pragma mark - searchBar Delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    SEDetailViewController *vc = [SEDetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    vc.searchStr = searchBar.text;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}


#pragma mark - tableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return countryArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CountryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (countryArr.count > indexPath.row) {
        NSString *str = countryArr[indexPath.row];
        NSArray *arr =[str componentsSeparatedByString:@"="];
        NSString *country = arr[0];
        cell.countryLab.text = country;
        cell.imageV.image = [UIImage imageNamed:country];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (countryArr.count > indexPath.row) {
        NSString *str = countryArr[indexPath.row];
        NSArray *arr =[str componentsSeparatedByString:@"="];
        NSString *country = arr[0];
        SEDetailViewController *vc = [SEDetailViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        vc.searchStr = country;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - collectionView Delegate and DataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SearchHotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchHotCell" forIndexPath:indexPath];
    cell.imageV.image = [UIImage imageNamed:imgArr[indexPath.row]];
    
    return cell;
}

//距离四周的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%zi",indexPath.row);
    
    SEDetailViewController *vc = [SEDetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    switch (indexPath.row) {
        case 0:
            vc.searchStr = @"曼谷";
            break;
        case 1:
            vc.searchStr = @"法国";
            break;
        case 2:
            vc.searchStr = @"清迈";
            break;
        case 3:
            vc.searchStr = @"芭提雅";
            break;
        case 4:
            vc.searchStr = @"奥地利";
            break;
        case 5:
            vc.searchStr = @"美国";
            break;
        case 6:
            vc.searchStr = @"德国";
            break;
        case 7:
            vc.searchStr = @"普吉岛";
            break;
        case 8:
            vc.searchStr = @"毛里求斯";
            break;
        case 9:
            vc.searchStr = @"意大利";
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
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
