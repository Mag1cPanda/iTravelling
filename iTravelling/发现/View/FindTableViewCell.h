//
//  FindTableViewCell.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/23.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UILabel *commentLab;
@property (weak, nonatomic) IBOutlet UILabel *likeLab;
@property (weak, nonatomic) IBOutlet UILabel *thumbLab;

@property (nonatomic, strong) NSDictionary *dic;
@end
