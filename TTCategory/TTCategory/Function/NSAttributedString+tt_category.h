//
//  NSObject+TTAttributeString.h
//  TTCategory
//
//  Created by tiperTan on 2017/12/18.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (tt_category)

#pragma mark
#pragma mark -----create 创建
/**
  *  单纯改变一句话中的某些字的颜色
  *
  *  @param color 需要改变成的颜色
  *  @param totalStr 总的字符串
  *  @param subArray 需要改变颜色的文字数组
  *
  *  @return 生成的富文本
  */
+ (NSMutableAttributedString *)tt_changeCorlorWithColor:(UIColor *)color totalString:(NSString *)totalStr subStringArray:(NSArray *)subArray;

/**
 *  单纯改变句子的字间距（需要 <coretext coretext.h="">）
 *
 *  @param totalString 需要更改的字符串
 *  @param space       字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)tt_changeSpaceWithTotalString:(NSString *)totalString space:(CGFloat)space;

/**
 *  单纯改变段落的行间距
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)tt_changeLineSpaceWithTotalString:(NSString *)totalString lineSpace:(CGFloat)lineSpace;

/**
 *  同时更改行间距和字间距
 *
 *  @param totalString 需要改变的字符串
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)tt_changeLineAndTextSpaceWithTotalString:(NSString *)totalString lineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace;

/**
 *  改变某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)tt_changeFontAndColor:(UIFont *)font color:(UIColor *)color totalString:(NSString *)totalString subStringArray:(NSArray *)subArray;

/**
 生成指定颜色指定font的富文本字符串

 @param text 文本内容
 @param textFont 文本字体
 @param textColor 文本颜色
 @return 富文本对象实例
 */
+(NSAttributedString*)tt_creatAttributedString:(NSString*)text WithTextFont:(UIFont*)textFont textColor:(UIColor*)textColor;
@end
