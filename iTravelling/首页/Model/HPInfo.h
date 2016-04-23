//
//  HPInfo.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/22.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "JSONModel.h"
#import "HPExtension.h"

@protocol HPInfo <NSObject>

@end

@interface HPInfo : JSONModel
@property (nonatomic, strong) HPExtension *extension;
@end
