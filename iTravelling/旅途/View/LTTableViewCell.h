//
//  LTTableViewCell.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/27.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJModel.h"
#import "TJModel.h"

@interface LTTableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL isFootMark;

@property (weak, nonatomic) IBOutlet UIImageView *yellowLine;
@property (weak, nonatomic) IBOutlet UIView *backWhite;

//足迹
@property (weak, nonatomic) IBOutlet UIImageView *zjImg;
@property (weak, nonatomic) IBOutlet UILabel *zjLab;

//其他
@property (weak, nonatomic) IBOutlet UIImageView *photoImg;
@property (weak, nonatomic) IBOutlet UILabel *photoCount;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *locationImg;
@property (weak, nonatomic) IBOutlet UIImageView *timeImg;
@property (weak, nonatomic) IBOutlet UILabel *loactionLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIImageView *topImg;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;


@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *beanCount;
@property (weak, nonatomic) IBOutlet UILabel *lookCount;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;

@property (nonatomic, strong) ZJModel *zjModel;
@property (nonatomic, strong) TJModel *tjModel;

@end
