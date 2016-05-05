//
//  FindDetailViewController.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/23.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "FindDetailViewController.h"
#import <WebKit/WebKit.h>
@interface FindDetailViewController ()
{
    WKWebView *webView;
}
@end

@implementation FindDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.dic[@"web_url"]]];
    [webView loadRequest:request];
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
