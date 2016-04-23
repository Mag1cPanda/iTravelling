//
//  HPModel.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/22.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "JSONModel.h"
#import "HPInfo.h"

@interface HPModel : JSONModel
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSArray<HPInfo> *info;
@end
