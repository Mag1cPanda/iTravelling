//
//  BaseViewController.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/23.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic, strong) SRDataSource *dataSource;
@property (nonatomic, strong) SRDelegate *delegate;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableDictionary *parameter;
@end
