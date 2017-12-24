//
//  UIColor+tt_category.h
//  TTCategory
//
//  Created by tiperTan on 2017/12/21.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (tt_category)

#pragma mark
#pragma mark -----create 创造
//获得一个随机颜色

/**
 生成一个随机色

 @return 随机UIColor对象
 */
+(UIColor*)tt_getRandomColor;


/**
 16进制颜色转换成UIColor

 @param hexColor 16进制字符串
 @return 16进制对应生成的UIColor对象
 */
+ (UIColor *)tt_getHexColor:(NSString *)hexColor;
#pragma mark
#pragma mark -----deal 处理
//混合颜色,ratio 0~1

/**
 混色方法

 @param color1 颜色对象1
 @param color2 颜色对象2
 @param ratio 俩颜色混色比例
 @return 混色后颜色对象
 */
+(UIColor *)tt_mixColor1:(UIColor*)color1 color2:(UIColor *)color2 ratio:(CGFloat)ratio;


@end
