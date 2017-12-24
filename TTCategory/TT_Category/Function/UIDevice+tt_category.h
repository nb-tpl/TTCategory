//
//  UIDevice+tt_category.h
//  TTCategory
//
//  Created by tiperTan on 2017/12/21.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (tt_category)
#pragma mark
#pragma mark -----Device info 设备信息

/**
 获得操作系统版本号

 @return 操作系统版本号
 */
+(NSString *)tt_getSystemVersion;

/**
 获得设备描述文字 e.g. @"iPhone", @"iPod touch"
 
 @return 设备描述
 */
+(NSString*)tt_getDeviceType;

@end
