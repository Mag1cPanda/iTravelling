//
//  TJModel.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/28.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface TJModel : BaseModel
@property (nonatomic, strong) NSNumber *memberType;
@property (nonatomic, copy) NSString *zanSumNum;//赞
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, strong) NSNumber *zanflag;
@property (nonatomic, strong) NSNumber *goodWeight;
@property (nonatomic, copy) NSString *country;//位置
@property (nonatomic, copy) NSString *cdSumNum;//豆子数量
@property (nonatomic, strong) NSNumber *authState;
@property (nonatomic, strong) NSNumber *scflag;
@property (nonatomic, copy) NSString *nickname;//用户名
@property (nonatomic, strong) NSNumber *plSumNum;
@property (nonatomic, copy) NSString *articleid;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSString *faceimgPath;
@property (nonatomic, strong) NSNumber *articleItemsNum;//照片数量
@property (nonatomic, copy) NSString *viewSumNum;//看过
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *orderCon;
@property (nonatomic, copy) NSString *faceimgId;
@property (nonatomic, copy) NSString *headimgPath;//用户照片
@property (nonatomic, strong) NSNumber *isGood;
@property (nonatomic, strong) NSNumber *isTop;
@property (nonatomic, copy) NSString *whereCon;
@property (nonatomic, strong) NSNumber *isPublish;
@property (nonatomic, copy) NSString *selectColumns;
@property (nonatomic, copy) NSString *dateTime;//时间
@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSString *updatetime;
@property (nonatomic, copy) NSString *userid;

@property (nonatomic, strong) NSArray *articleCommentsList;
@property (nonatomic, strong) NSArray *articleRewardsList;
@property (nonatomic, strong) NSArray *articleZansList;
@property (nonatomic, strong) NSArray *userids;
@property (nonatomic, strong) NSArray *articleItemsList;
@property (nonatomic, strong) NSArray *articleids;
@property (nonatomic, strong) NSArray *articleViewsList;

@end
