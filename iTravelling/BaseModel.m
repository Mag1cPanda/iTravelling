//
//  BaseModel.m
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/28.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //    NSLog(@"%@",key);
}


-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
