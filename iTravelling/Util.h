//
//  Util.h
//  iTravelling
//
//  Created by Mag1cPanda on 16/4/23.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
#pragma mark 获取屏幕宽度
+(CGFloat)getUIScreenWidth;

#pragma mark 获取屏幕高度
+(CGFloat)getUIScreenHeight;

#pragma mark 系统版本
+(float)getVersion;

#pragma mark 状态栏高度
+(int)getStatusBarHeight;

#pragma mark 导航栏高度
+(CGFloat)getnavigationBarHeight:(UINavigationController *)nav;

#pragma mark 导航栏高度和状态栏的总高度
+(CGFloat)getStatusBarAndnavigationBarHeight:(UINavigationController *)nav;

#pragma mark 加密
+(NSString *)encryption:(NSString *)content mark:(int)mark;

#pragma mark 图片缩放
+(UIImage*) originImage:(UIImage *)image scaleToSize:(CGSize)size;

#pragma mark 图片的旋转
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

#pragma mark 根据格式获取当前时间
+(NSString *)getCurrentTimeByFormal:(NSString *)formal;

#pragma mark 获取图片的大小（单位为K）
+(NSNumber *)getImageBig:(UIImage *)image;

#pragma mark 获取设备名称
+(NSString *)getCurrentDeviceName;

#pragma mark 获取唯一表示符
+(NSString *)getIdentifierForVendor;

#pragma mark 返回key值
+(NSString *)getKey;

#pragma mark 将字典写入文件中
+(BOOL)DicWrite2File:(NSString *) dicPath fileName:(NSString *)fileName Dic:(NSDictionary *)dic;

#pragma mark 获取当前时间戳
+(long)getCurrentTime;

#pragma mark 判断一个字符串是否全部为数字
+ (BOOL)isPureInt:(NSString *)string;

#pragma mark 设置UITextField距离左边的距离
+(void)setTextFieldLeftPadding:(UITextField *)textField forWidth:(CGFloat)leftWidth;

#pragma mark - 车牌号正则验证
+ (BOOL)validateCarNo:(NSString *)carNo;

#pragma mark - 根据字符串计算size
+(CGSize)sr_DrawTextRectWithString:(NSString *)text Width:(CGFloat)width FondSize:(CGFloat)fontSize;
#pragma mark - 转json
+ (NSString*)objectToJson:(NSObject *)object;

#pragma mark - json字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

#pragma mark - 16进制颜色
+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
