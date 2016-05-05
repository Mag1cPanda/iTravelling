//
//  LTTableViewCell.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/27.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "LTTableViewCell.h"

@implementation LTTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.contentView bringSubviewToFront:self.yellowLine];
}

-(void)setIsFootMark:(BOOL)isFootMark{
    _isFootMark = isFootMark;
    if (_isFootMark) {
        self.photoImg.hidden = YES;
        self.photoCount.hidden = YES;
        self.topImg.hidden = YES;
        self.locationImg.hidden = YES;
        self.loactionLab.hidden = YES;
        self.timeImg.hidden = YES;
        self.timeLab.hidden = YES;
        self.titleLab.hidden = YES;
    }
    else {
        self.zjImg.hidden = YES;
        self.zjLab.hidden = YES;
    }
}

-(void)setZjModel:(ZJModel *)zjModel{
    _zjModel = zjModel;
    self.zjLab.text = zjModel.content;
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",LTIMgPrefix,zjModel.headImgPath];
    [self.icon sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"noteBg_305x137_"]];
    
    self.nameLab.text = zjModel.nickname;
    
    self.beanCount.text = [NSString stringWithFormat:@"%@",zjModel.cdSumNum];

    self.lookCount.text = [NSString stringWithFormat:@"%@",zjModel.viewSumNum];
    self.likeCount.text = [NSString stringWithFormat:@"%@",zjModel.zanSumNum];
}

-(void)setTjModel:(TJModel *)tjModel{
    _tjModel = tjModel;
    self.titleLab.text = tjModel.title;
    self.photoCount.text = [NSString stringWithFormat:@"%@张",tjModel.articleItemsNum];
    NSString *imgUrl = [NSString stringWithFormat:@"%@%@",LTIMgPrefix,tjModel.faceimgPath];
    [self.backImage sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"noteBg_305x137_"]];
    
    NSString *iconUrl = [NSString stringWithFormat:@"%@%@",LTIMgPrefix,tjModel.headimgPath];
    [self.icon sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:@"noteBg_305x137_"]];
    
    self.nameLab.text = tjModel.nickname;
    NSString *beanNum = [NSString stringWithFormat:@"%.2fkg",[tjModel.cdSumNum floatValue]/1000];
    self.beanCount.text = beanNum;
    
    self.lookCount.text = [NSString stringWithFormat:@"%@",tjModel.viewSumNum];
    self.likeCount.text = [NSString stringWithFormat:@"%@",tjModel.zanSumNum];
    
    self.loactionLab.text = [NSString stringWithFormat:@"%@ %@",tjModel.country,tjModel.city];
    
    NSString *mStr = [NSMutableString stringWithString:tjModel.dateTime];
    self.timeLab.text = [mStr substringToIndex:10];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
