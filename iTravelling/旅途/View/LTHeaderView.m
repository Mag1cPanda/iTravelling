//
//  LTHeaderView.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/5/4.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "LTHeaderView.h"

@implementation LTHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.mostNewBtn = [[SRButton alloc] initWithFrame:CGRectMake(0, 160, SCREEN_W/4, 60)];
        [self.mostNewBtn setTitle:@"最新" forState:0];
        [self.mostNewBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        [self.mostNewBtn setImage:[UIImage imageNamed:@"LT_sizer_new_17x17_"] forState:0];
        [self addSubview:self.mostNewBtn];
        
        self.hotBtn = [[SRButton alloc] initWithFrame:CGRectMake(SCREEN_W/4, 160, SCREEN_W/4, 60)];
        [self.hotBtn setTitle:@"热门" forState:0];
        [self.hotBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        [self.hotBtn setImage:[UIImage imageNamed:@"LT_sizer_hot_12x17_"] forState:0];
        [self addSubview:self.hotBtn];
        
        self.bigNamesBtn = [[SRButton alloc] initWithFrame:CGRectMake(SCREEN_W/2, 160, SCREEN_W/4, 60)];
        [self.bigNamesBtn setTitle:@"大咖" forState:0];
        [self.bigNamesBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        [self.bigNamesBtn setImage:[UIImage imageNamed:@"LT_sizer_vip_17x17_"] forState:0];
        [self addSubview:self.bigNamesBtn];
        
        self.attentionBtn = [[SRButton alloc] initWithFrame:CGRectMake(SCREEN_W/4*3, 160, SCREEN_W/4, 60)];
        [self.attentionBtn setTitle:@"关注" forState:0];
        [self.attentionBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        [self.attentionBtn setImage:[UIImage imageNamed:@"LT_sizer_attention_14x13_"] forState:0];
        [self addSubview:self.attentionBtn];
        
        self.cycleScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, frame.size.width, 160) delegate:nil placeholderImage:[UIImage imageNamed:@"placeholder"]];
        self.cycleScroll.autoScrollTimeInterval = 5;
        self.cycleScroll.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        self.cycleScroll.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        [self addSubview:self.cycleScroll];
    }
    return self;
}

@end
