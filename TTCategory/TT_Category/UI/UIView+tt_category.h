//
//  UIView+tt_category.h
//  TTCategory
//
//  Created by tiperTan on 2017/12/21.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (tt_category)
#pragma mark
#pragma mark -----Dreate 创建

/**
 创建一个指定颜色和宽度的线视图

 @param lineColor 线颜色
 @param lineWidth 线宽度
 @return 结果视图对象
 */
+ (UIView*)tt_createALineViewWithLineColor:(UIColor*)lineColor lineWidth:(CGFloat)lineWidth;

/**
 复制一个UIView

 @param view 需要复制的视图实例
 @return 返回复制出来的实例
 */
+ (UIView *)tt_duplicate:(UIView *)view;
#pragma mark
#pragma mark -----Deal 处理
//给指定view上的所有view附上随即颜色
+ (void)tt_setRandomColorToSubviewsForView:(UIView*)view;

#pragma mark
#pragma mark ----- Origin and Size 位置与大小
/**
 * Shortcut for frame.size.witdth*0.5 size大小的中心X坐标
 */
@property (nonatomic,readonly) CGFloat tt_sizeCenterX;
/**
 * Shortcut for frame.size.height*0.5
 */
@property (nonatomic,readonly) CGFloat tt_sizeCenterY;

/**
 * Shortcut for CGPointMake(self.tt_sizeCenterX,self.tt_sizeCenterY)
 */
@property (nonatomic,readonly) CGPoint tt_sizeCenter;
/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = tt_left
 */
@property (nonatomic) CGFloat tt_left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = tt_top
 */
@property (nonatomic) CGFloat tt_top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = tt_right - frame.size.width
 */
@property (nonatomic) CGFloat tt_right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = tt_bottom - frame.size.height
 */
@property (nonatomic) CGFloat tt_bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = tt_width
 */
@property (nonatomic) CGFloat tt_width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = tt_height
 */
@property (nonatomic) CGFloat tt_height;

/**
 * Shortcut for bounds.size.width
 *
 * Sets bounds.size.width = tt_bwidth
 */
@property (nonatomic,readonly) CGFloat tt_bwidth;
/**
 * Shortcut for bounds.origin.x
 *
 * Sets     bounds.origin.x = tt_bx
 */
@property (nonatomic, assign) CGFloat tt_bx;
/**
 * Shortcut for bounds.origin.y
 *
 * Sets bounds.origin.y = tt_by
 */
@property (nonatomic, assign) CGFloat tt_by;

/**
 * Shortcut for bounds.size.height
 *
 * Sets bounds.size.height = tt_bheight
 */
@property (nonatomic,readonly) CGFloat tt_bheight;
/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat tt_centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat tt_centerY;

///**
// * Return the x coordinate on the screen.
// */
//@property (nonatomic, readonly) CGFloat ttScreenX;
//
///**
// * Return the y coordinate on the screen.
// */
//@property (nonatomic, readonly) CGFloat ttScreenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat tt_toScreenX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat tt_toScreenY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect tt_screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint tt_origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize tt_size;

/**
 * Shortcut for set origin, put view anchor point at pos.
 *
 * anchor point (0,0) is left top, (1,1) is right bottom.
 * @return self
 */
- (id)tt_pos:(CGPoint)pos withAnchor:(CGPoint)anchor;

/**
 * Return the width in portrait or the height in landscape.
 */
@property (nonatomic, readonly) CGFloat tt_orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property (nonatomic, readonly) CGFloat tt_orientationHeight;

/**
 * Removes all subviews.
 */
- (void)tt_removeAllSubviews;
/**
 * Calculates the offset of this view from another view in screen coordinates.
 *
 * otherView should be a parent view of this view.
 */
- (CGPoint)tt_offsetFromView:(UIView*)otherView;

/**
 * Get the UIViewController for the view.
 *
 */
- (UIViewController*)tt_viewController;

-(UIImage *)tt_screenShootWithSelf:(BOOL)bWithSelf;

-(UIImage *)tt_screenShootSelf;


@end
