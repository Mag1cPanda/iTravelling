//
//  SRDelegate.h
//  TableViewOptimized
//
//  Created by Mag1cPanda on 16/3/8.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

typedef void (^CellHandleBlock)(NSIndexPath *indexPath);

@interface SRDelegate : NSObject<UITableViewDelegate,DZNEmptyDataSetDelegate>
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
//处理cell点击事件的代码块
@property (nonatomic, copy) CellHandleBlock handleBlock;
@property (nonatomic, copy) CellHandleBlock selectBlock;
@property (nonatomic, copy) CellHandleBlock deSelectBlock;

//delegate构造方法
-(instancetype)initWithCellHeight:(CGFloat)cellHeight HandleBlock:(CellHandleBlock)block;

-(instancetype)initWithCellHeight:(CGFloat)cellHeight didSelectRow:(CellHandleBlock)selectBlock didDeSelectRow:(CellHandleBlock)deSelectBlock;
@end
