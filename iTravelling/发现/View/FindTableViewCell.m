//
//  FindTableViewCell.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/23.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "FindTableViewCell.h"

@implementation FindTableViewCell

-(void)setDic:(NSDictionary *)dic {
    _dic = dic;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMGPrefix,dic[@"picpath"][0]]] placeholderImage:[UIImage imageNamed:@"noteBg_305x137_"]];
    self.titleLab.text = dic[@"title"];
    self.commentLab.text = dic[@"countcomment"];
    self.likeLab.text = dic[@"countcollect"];
    self.thumbLab.text = dic[@"praise_number"];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
