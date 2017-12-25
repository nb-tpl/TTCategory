//
//  NSObject+tt_category.h
//  TTCategory
//
//  Created by tiperTan on 2017/12/21.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




//实际屏幕宽和高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


@interface NSObject (tt_category)



#pragma mark
#pragma mark -----GlobalFind 全局获取
/**
 获取当前最前面视图控制器
 
 @return 当前最前端视图控制器
 */
- (UIViewController * )tt_frontVC;


#pragma mark
#pragma mark -----GlobalSet 全局设置

/**
 禁止交互
 */
+(void)ignoringInteractionEvents;

/**
 启用交互
 */
+(void)endIgnoringInteractionEvents;

#pragma mark
#pragma mark -----fitValue 适配
//6P图像素位置转换  基图为1080P
#define point2IP6P_PX(value) ([NSObject pointToFit6PPXValue:value])

#define point2IP6_PT(value) ([NSObject pointToFitIP6PTValue:value])


//1080P图像素位置
+ (CGFloat)pointToFitIP6PPXValue:(CGFloat)pxValue;

//iP6为基准  pt位置转换成其它尺寸pt
+ (CGFloat)pointToFitIP6PTValue:(CGFloat)ptValue;



@end
