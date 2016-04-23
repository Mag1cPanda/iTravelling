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
        self.configureBlock = [configureBlock copy];
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
            _configureBlock(cell, model);
        }
    }
    return cell;
}

@end
