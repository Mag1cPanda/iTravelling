//
//  SRDataSource.m
//  TableViewOptimized
//
//  Created by Mag1cPanda on 16/3/8.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "SRDataSource.h"

@implementation SRDataSource

-(instancetype)initWithDataArray:(NSArray *)dataArray sectionCount:(NSInteger)sectionCount cellIdentifier:(NSString *)cellIdentifier configureBlock:(SRCellConfigureBlock)configureBlock{
    self = [super init];
    if (self) {
        self.dataArray = dataArray;
        self.sectionCount = sectionCount;
        self.cellIdentifier = cellIdentifier;
        self.configureBlock = configureBlock;
    }
    return self;
}


#pragma mark - tableView DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionCount;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    if (_dataArray.count > indexPath.row) {
        
        id model = _dataArray[indexPath.row];
        //调用配置cell的代码块
        if (_configureBlock) {
            _configureBlock(cell, model, indexPath);
        }
    }
    return cell;
}

//数组为空时table展示的页面
//- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
//    NSString *text = @"正在加载...";
//    UIFont *font = [UIFont systemFontOfSize:14.0];
//    UIColor *textColor = [Util colorWithHexString:@"333333"];
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    [attributes setObject:font forKey:NSFontAttributeName];
//    [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
//    return attributedString;
//}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    
    return [UIImage imageNamed: @"noproduct"];
}

@end
