//
//  NSObject+TTAttributeString.m
//  TTCategory
//
//  Created by tiperTan on 2017/12/18.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import "NSAttributedString+tt_category.h"
#import <CoreText/CoreText.h>

@implementation NSAttributedString (tt_category)



/**
  *  单纯改变一句话中的某些字的颜色
  *
  *  @param color 需要改变成的颜色
  *  @param totalStr 总的字符串
  *  @param subArray 需要改变颜色的文字数组
  *
  *  @return 生成的富文本
  */
+ (NSMutableAttributedString *)tt_changeCorlorWithColor:(UIColor *)color totalString:(NSString *)totalStr subStringArray:(NSArray *)subArray {
    NSMutableAttributedString * attributedStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    for(NSString * rangeStr in subArray) {
        NSRange range = [totalStr rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attributedStr;
}

/**
 *  单纯改变句子的字间距（需要 <coretext coretext.h="">）
 *
 *  @param totalString 需要更改的字符串
 *  @param space       字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)tt_changeSpaceWithTotalString:(NSString *)totalString space:(CGFloat)space {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    long number = space;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedStr length])];
    CFRelease(num);
    return attributedStr;
}

/**
 *  单纯改变段落的行间距
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)tt_changeLineSpaceWithTotalString:(NSString *)totalString lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];
    return attributedStr;
}

/**
 *  同时更改行间距和字间距
 *
 *  @param totalString 需要改变的字符串
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)tt_changeLineAndTextSpaceWithTotalString:(NSString *)totalString lineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalString length])];
    long number = textSpace;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributedStr addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributedStr length])];
    CFRelease(num);
    return attributedStr;
}

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
+ (NSMutableAttributedString *)tt_changeFontAndColor:(UIFont *)font color:(UIColor *)color totalString:(NSString *)totalString subStringArray:(NSArray *)subArray {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalString];
    for (NSString *rangeStr in subArray) {
        NSRange range = [totalString rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:range];
        [attributedStr addAttribute:NSFontAttributeName value:font range:range];
    }
    return attributedStr;
}

//生成指定颜色指定font的富文本字符串
+(NSAttributedString*)tt_creatAttributedString:(NSString*)text WithTextFont:(UIFont*)textFont textColor:(UIColor*)textColor
{
    NSAttributedString * attributeString = [[NSAttributedString alloc] initWithString:text attributes:[NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName,textColor,NSForegroundColorAttributeName, nil]];
    return attributeString;
}


@end
