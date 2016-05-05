//
//  HPDetailCell.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/23.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "HPDetailCell.h"

@implementation HPDetailCell

-(void)setDic:(NSDictionary *)dic{
    _dic = dic;
    NSString *imgUrl = [NSString stringWithFormat:@"%@%@",IMGPrefix,dic[@"picpath"]];
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"noteBg_305x137_"]];
    self.titleLab.text = dic[@"title"];
    self.priceLab.text = [NSString stringWithFormat:@"￥%@",dic[@"view_price"]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
