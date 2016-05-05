//
//  LTHeaderView.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/5/4.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "SRButton.h"

@interface LTHeaderView : UIView
@property (nonatomic, strong) SDCycleScrollView *cycleScroll;
@property (nonatomic, strong) SRButton *mostNewBtn;
@property (nonatomic, strong) SRButton *hotBtn;
@property (nonatomic, strong) SRButton *bigNamesBtn;
@property (nonatomic, strong) SRButton *attentionBtn;
@end
