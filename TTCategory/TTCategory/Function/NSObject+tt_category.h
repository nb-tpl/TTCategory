//
//  NSObject+tt_category.h
//  TTCategory
//
//  Created by tiperTan on 2017/12/21.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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




@end
