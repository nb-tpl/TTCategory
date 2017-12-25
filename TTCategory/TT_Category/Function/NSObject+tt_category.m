//
//  NSObject+tt_category.m
//  TTCategory
//
//  Created by tiperTan on 2017/12/21.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import "NSObject+tt_category.h"

@implementation NSObject (tt_category)

#pragma mark -----findGloba
- (UIViewController * )tt_frontVC
{
    //找到window最前面的ViewController
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    return result;
    
}

#pragma mark -----GlobalSet 全局设置
/**
 禁止交互
 */
+(void)ignoringInteractionEvents
{
    if (![[UIApplication sharedApplication] isIgnoringInteractionEvents])    //禁止交互
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
}

/**
 启用交互
 */
+(void)endIgnoringInteractionEvents
{
    if ([[UIApplication sharedApplication] isIgnoringInteractionEvents])
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
}



#pragma mark
#pragma mark -----fitValue 适配
#define fitiPhone472iPhone55 (414.0f/375.0f)
#define fitiPhone42iPhone47  (375.0f/320.f)
#define tempValue (414.0f/1080.0f)

+(CGFloat)pointToFitIP6PPXValue:(CGFloat)pxValue
{
    
    //4寸
    CGFloat realPoint = pxValue * tempValue;
    if (ScreenWidth < 375) {
        return ((realPoint/fitiPhone472iPhone55)/fitiPhone42iPhone47);
    }else if(ScreenWidth < 414)//4.7
    {
        return realPoint/fitiPhone472iPhone55;
    }else {//5.5
        return realPoint;
    }
}


//iP6为基准  pt位置转换成其它尺寸pt
+ (CGFloat)pointToFitIP6PTValue:(CGFloat)ptValue
{
    //4寸
    if (ScreenWidth < 375) {
        return (ptValue/375.0)*320.0;
    }else if(ScreenWidth < 414)//4.7
    {
        return ptValue;
    }else {//5.5
        return (ptValue/375.0)*414.0;
    }
}

@end
