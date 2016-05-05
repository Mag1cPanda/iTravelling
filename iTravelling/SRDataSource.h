//
//  SRDataSource.h
//  TableViewOptimized
//
//  Created by Mag1cPanda on 16/3/8.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"
//model有可能为空  所以使用id
typedef void (^SRCellConfigureBlock)(id cell, id model , NSIndexPath *indexPath);
@interface SRDataSource : NSObject<UITableViewDataSource,DZNEmptyDataSetSource>

@property (nonatomic, assign) NSInteger sectionCount;
@property (nonatomic, strong) NSArray *dataArray;//数据源
@property (nonatomic, copy) NSString *cellIdentifier;//cellID
//配置cell的Block
@property (nonatomic, copy) SRCellConfigureBlock configureBlock;

//dataSource构造方法
-(instancetype)initWithDataArray:(NSArray *)dataArray sectionCount:(NSInteger)sectionCount cellIdentifier:(NSString *)cellIdentifier configureBlock:(SRCellConfigureBlock)configureBlock;

@end
