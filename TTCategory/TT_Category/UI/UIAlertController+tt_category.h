//
//  UIAlertController+TTAlert.h
//  TTCategory
//
//  Created by tiperTan on 2017/12/18.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (tt_category)




+ (UIAlertController *)tt_alertControllerWithTitle:(NSString *)title titleColor:(UIColor *)titleColor message:(NSString *)message cancleTitle:(NSString *)cancleTitle cancleTitleColor:(UIColor *)cancleTitleColor canclehandler:(void (^)(UIAlertAction *action))cancleHandler commitTitle:(NSString *)commitTitle commitTitleColor:(UIColor *)commitTitleColor commithandler:(void (^)(UIAlertAction *action))commitHandler;


-(void)show:(BOOL)animate;
@end
