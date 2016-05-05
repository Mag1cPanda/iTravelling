//
//  SRButton.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/5/4.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "SRButton.h"

@implementation SRButton

- (void)setHighlighted:(BOOL)highlighted
{
    // 目的就是重写取消高亮显示
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //    self.titleLabel.x = self.imageView.x;
    self.imageView.y = 10;
    self.imageView.width = 25;
    self.imageView.height = 25;
    self.imageView.x = (self.width - self.imageView.width)/2.0;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.titleLabel.x = self.imageView.x - (self.titleLabel.width - self.imageView.width)/2.0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + 5;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.shadowColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
