//
//  SREasyMacro.h
//  SRLibrary
//
//  Created by Mag1cPanda on 16/3/16.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#ifndef SREasyMacro_h
#define SREasyMacro_h

/** 字体*/
#define SRFont(x) [UIFont systemFontOfSize:x]
#define SRBoldFont(x) [UIFont boldSystemFontOfSize:x]

/** 颜色*/
#define SRRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define SRRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define SRRGB16Color(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/** 输出*/
#ifdef DEBUG
#define SRLog(...) NSLog(__VA_ARGS__)
#else
#define SRLog(...)
#endif

/** 获取硬件信息*/
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define SRCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define SRCurrentSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]


/** 适配*/
#define SRiOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define SRiOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define SRiOS_9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#define SRiPhone4_OR_4s    (SXSCREEN_H == 480)
#define SRiPhone5_OR_5c_OR_5s   (SXSCREEN_H == 568)
#define SRiPhone6_OR_6s   (SXSCREEN_H == 667)
#define SRiPhone6Plus_OR_6sPlus   (SXSCREEN_H == 736)
#define SRiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 弱指针*/
#define SRWeakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;

/** 加载本地文件*/
#define SRLoadImage(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define SRLoadArray(file,type) [UIImage arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
#define SRLoadDict(file,type) [UIImage dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

/** 多线程GCD*/
#define SRGlobalGCD(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define SRMainGCD(block) dispatch_async(dispatch_get_main_queue(),block)

//通知中心
#define SRNotificationCenter [NSNotificationCenter defaultCenter]

//UIApplication
#define SRApplication [UIApplication sharedApplication];

/** 数据存储*/
#define SRUserDefaults [NSUserDefaults standardUserDefaults]
#define SRCacheDir [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define SRDocumentDir [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define SRTempDir NSTemporaryDirectory()

#endif /* SREasyMacro_h */
