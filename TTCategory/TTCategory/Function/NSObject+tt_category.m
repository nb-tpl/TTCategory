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

@end
