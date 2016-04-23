//
//  HPTableViewCell.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/22.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "HPTableViewCell.h"

@implementation HPTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    NSString *imgUrl = [NSString stringWithFormat:@"%@%@",IMGPrefix,dic[@"picpath"]];
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    self.titleLab.text = dic[@"title"];
    self.subTitleLab.text = dic[@"bewrite"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
