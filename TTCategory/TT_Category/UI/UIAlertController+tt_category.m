//
//  UIAlertController+TTAlert.m
//  TTCategory
//
//  Created by tiperTan on 2017/12/18.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import "UIAlertController+tt_category.h"

#import "NSObject+tt_category.h"

@implementation UIAlertController (tt_category)


+ (UIAlertController *)tt_alertControllerWithTitle:(NSString *)title titleColor:(UIColor *)titleColor message:(NSString *)message cancleTitle:(NSString *)cancleTitle cancleTitleColor:(UIColor *)cancleTitleColor canclehandler:(void (^)(UIAlertAction *action))cancleHandler commitTitle:(NSString *)commitTitle commitTitleColor:(UIColor *)commitTitleColor commithandler:(void (^)(UIAlertAction *action))commitHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title ? title : @"" message:message ? message : @"" preferredStyle:UIAlertControllerStyleAlert];

    //修改标题的内容，字号，颜色。使用的key值是“attributedTitle”
    NSMutableAttributedString * attributeTitle = [[NSMutableAttributedString alloc] initWithString:(title ? title:@"")];
    [attributeTitle addAttribute:NSForegroundColorAttributeName value:titleColor range:NSMakeRange(0, [[attributeTitle string] length])];
    [alertController setValue:attributeTitle forKey:@"attributedTitle"];
    
    //修改按钮的颜色，同上可以使用同样的方法修改内容，样式
    if(cancleTitle && ![cancleTitle isEqualToString:@""]){
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:cancleHandler];
        if(cancleTitleColor) {
            [cancelAction setValue:cancleTitleColor forKey:@"_titleTextColor"];
        }
        [alertController addAction:cancelAction];
    }
    
    if(commitTitle && ![commitTitle isEqualToString:@""]) {
        UIAlertAction *commitAction = [UIAlertAction actionWithTitle:commitTitle style:UIAlertActionStyleDefault handler:commitHandler];
        if(commitTitleColor) {
            [commitAction setValue:commitTitleColor forKey:@"_titleTextColor"];
        }
        [alertController addAction:commitAction];
    }
    
    return alertController;
}

- (void)show:(BOOL)animate
{
    [[NSObject tt_frontVC] presentViewController:self animated:animate completion:nil];
}


@end
