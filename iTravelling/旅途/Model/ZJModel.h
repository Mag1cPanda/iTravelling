//
//  ZJModel.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/27.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface ZJModel : BaseModel
@property (nonatomic, copy) NSString *provincename;
@property (nonatomic, copy) NSString *zanflag;
@property (nonatomic, copy) NSString *createtime;
@property (nonatomic, copy) NSString *headImgPath;
@property (nonatomic, copy) NSString *footmarkid;
@property (nonatomic, copy) NSString *userid;
@property (nonatomic, copy) NSString *countryname;
@property (nonatomic, copy) NSString *cityname;
@property (nonatomic, copy) NSString *viewSumNum;
@property (nonatomic, copy) NSString *cdSumNum;
@property (nonatomic, copy) NSString *ranknum;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *mark;
@property (nonatomic, copy) NSString *zanSumNum;
@property (nonatomic, copy) NSString *content;


@end
