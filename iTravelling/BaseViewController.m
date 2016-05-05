//
//  BaseViewController.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/23.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
 - (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray array];
    self.parameter = [NSMutableDictionary dictionary];
    
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    //隐藏taBbar的分割线
    for (UIView *view in self.tabBarController.tabBar.subviews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            view.hidden = YES;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:YES];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//}
//
//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:YES];
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
