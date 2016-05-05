//
//  SRDelegate.m
//  TableViewOptimized
//
//  Created by Mag1cPanda on 16/3/8.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "SRDelegate.h"

@implementation SRDelegate

-(instancetype)initWithCellHeight:(CGFloat)cellHeight HandleBlock:(CellHandleBlock)block{
    self = [super init];
    if (self) {
        self.cellHeight = cellHeight;
        self.handleBlock = block;
    }
    return self;
}

-(instancetype)initWithCellHeight:(CGFloat)cellHeight didSelectRow:(CellHandleBlock)selectBlock didDeSelectRow:(CellHandleBlock)deSelectBlock{
    self = [super init];
    if (self) {
        self.cellHeight = cellHeight;
        self.selectBlock = selectBlock;
        self.deSelectBlock = deSelectBlock;
    }
    return self;
}

#pragma mark - tableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.cellHeight) {
        return 44;
    }
    else return self.cellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //如果没有给headerHeight赋值，则默认为0
    if (!self.headerHeight) {
        self.headerHeight = 0.0000001;
    }
    return self.headerHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    //如果没有给footerHeight赋值，则默认为0
    if (!self.footerHeight) {
        self.footerHeight = 0.0000001;
    }
    return self.footerHeight;
}

//补全分割线
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell  respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //调用cell点击事件的代码块
    if (_handleBlock) {
        _handleBlock(indexPath);
    }
    
    if (_selectBlock) {
        _selectBlock(indexPath);
    }
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_deSelectBlock) {
        _deSelectBlock(indexPath);
    }
}

#pragma mark - DZNEmptyDataSetDelegate Methods

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

@end
