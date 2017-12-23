//
//  UIButton+tplAdd.h
//  Look
//
//  Created by 谭鄱仑 on 15/12/8.
//  Copyright © 2015年 谭鄱仑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (tt_category)



#pragma mark -----create 创建
/**
 快速创建按钮，以及响应代码

 @param buttonType 按钮类型
 @param actionBlock 按钮点击响应块
 @return 按钮对象
 */
+ (UIButton *)tt_buttonWithType:(UIButtonType)buttonType touchUpInsideActionBlock:(void (^)(id sender))actionBlock;







#pragma test
+ (UIButton *)tt_testButtonWithType:(UIButtonType)buttonType inView:(UIView *)view touchUpInsideActionBlock:(void (^)(id sender))actionBlock;



@end
