//
//  BannerModel.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/28.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface BannerModel : BaseModel
@property (nonatomic, copy) NSString *article_id;
@property (nonatomic, copy) NSString *article_faceimg;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *article_userid;
@property (nonatomic, copy) NSString *article_type;
@property (nonatomic, copy) NSString *href;
@end
