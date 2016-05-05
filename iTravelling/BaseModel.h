//
//  BaseModel.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/28.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
 -(void)setValue:(id)value forUndefinedKey:(NSString *)key;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
