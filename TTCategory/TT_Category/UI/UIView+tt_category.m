//
//  UIView+tt_category.m
//  TTCategory
//
//  Created by tiperTan on 2017/12/21.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import "UIView+tt_category.h"
#import "UIColor+tt_category.h"

@implementation UIView (tt_category)

#pragma mark -----Create 创建
+ (UIView*)tt_createALineViewWithLineColor:(UIColor*)lineColor lineWidth:(CGFloat)lineWidth
{
    UIView * lineView = [[UIView alloc] init];
    lineView.layer.borderColor = lineColor.CGColor;
    lineView.layer.borderWidth = lineWidth;
    return lineView;
}

+ (UIView *)tt_duplicate:(UIView *)view
{
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}


#pragma mark -----Deal 处理
+ (void)tt_setRandomColorToSubviewsForView:(UIView*)view
{
    view.backgroundColor = [UIColor tt_getRandomColor];
    if (view.subviews.count > 0)
    {
        for (UIView * subview in view.subviews)
        {
            [self tt_setRandomColorToSubviewsForView:subview];
        }
    }
}



#pragma mark ----- Origin and Size 位置与大小
CGAffineTransform gTransformBetweenInterface(UIInterfaceOrientation from, UIInterfaceOrientation to){
    // 按旋转顺序排起来
    const UIInterfaceOrientation faces[] = {UIInterfaceOrientationLandscapeLeft,
        UIInterfaceOrientationPortrait, UIInterfaceOrientationLandscapeRight,
        UIInterfaceOrientationPortraitUpsideDown};
    int f=-1,t=-1, i;
    for (i=0;i<4;++i){
        if (faces[i] == from){ f = i; break; }
    }
    for (i=0;i<4;++i){
        if (faces[i] == to){ t = i; break; }
    }
    if (f>=0 && t>=0 && f!=t){
        i = t-f;
        if (i<-2) i+=4; else if (i>2) i-=4;
        return CGAffineTransformMakeRotation(i*M_PI_2);
    }
    return CGAffineTransformIdentity;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(CGFloat)tt_sizeCenterX{
    return self.frame.size.width*0.5;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(CGFloat)tt_sizeCenterY{
    return self.frame.size.height*0.5;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
-(CGPoint)tt_sizeCenter{
    return CGPointMake(self.tt_sizeCenterX, self.tt_sizeCenterY);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_left {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
-(void)setTt_left:(CGFloat)tt_left{
    CGRect frame = self.frame;
    frame.origin.x = tt_left;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_top {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTt_top:(CGFloat)tt_top {
    CGRect frame = self.frame;
    frame.origin.y = tt_top;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_right {
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTt_right:(CGFloat)tt_right {
    CGRect frame = self.frame;
    frame.origin.x = tt_right - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
-(void)setTt_bottom:(CGFloat)tt_bottom{
    CGRect frame = self.frame;
    frame.origin.y = tt_bottom - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_centerX{
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
-(void)setTt_centerX:(CGFloat)tt_centerX
{
    self.center = CGPointMake(tt_centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_centerY {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTt_centerY:(CGFloat)tt_centerY {
    self.center = CGPointMake(self.center.x, tt_centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_width {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTt_width:(CGFloat)tt_width {
    CGRect frame = self.frame;
    frame.size.width = tt_width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_height {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTt_height:(CGFloat)tt_height {
    CGRect frame = self.frame;
    frame.size.height = tt_height;
    self.frame = frame;
}

-(CGFloat)tt_bwidth{
    return self.bounds.size.width;
}


- (CGFloat)tt_bheight{
    return self.bounds.size.height;
}
- (CGFloat)tt_bx{
    return self.bounds.origin.x;
}
- (CGFloat)tt_by{
    return self.bounds.origin.y;
}

- (void)setTt_bx:(CGFloat)tt_bx {
    self.bounds = CGRectMake(tt_bx, self.tt_by, self.tt_bwidth, self.tt_bheight);
}
- (void)setTt_by:(CGFloat)tt_by {
    self.bounds = CGRectMake(self.tt_bx, tt_by, self.tt_bwidth, self.tt_bheight);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ttScreenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.tt_left;
    }
    return x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ttScreenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.tt_top;
    }
    return y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_toScreenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.tt_left;
        
        if (view!=self && [view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_toScreenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.tt_top;
        
        if (view!=self && [view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)tt_screenFrame {
    return CGRectMake(self.tt_toScreenX, self.tt_toScreenY, self.tt_width, self.tt_height);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)tt_origin {
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTt_origin:(CGPoint)tt_origin {
    CGRect frame = self.frame;
    frame.origin = tt_origin;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)tt_size {
    return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTt_size:(CGSize)tt_size {
    CGRect frame = self.frame;
    frame.size = tt_size;
    self.frame = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)tt_pos:(CGPoint)pos withAnchor:(CGPoint)anchor {
    CGSize size = self.frame.size;
    self.tt_origin = CGPointMake(pos.x - anchor.x * size.width, pos.y - anchor.y * size.height);
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_orientationWidth {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.tt_height : self.tt_width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tt_orientationHeight {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.tt_width : self.tt_height;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tt_removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)tt_offsetFromView:(UIView *)otherView {
    
    CGFloat x = 0, y = 0;
    for (UIView* view = self; view && view != otherView; view = view.superview) {
        x += view.tt_left;
        y += view.tt_top;
    }
    return CGPointMake(x, y);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIViewController *)tt_viewController {
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (UIImage *)tt_screenShootWithSelf:(BOOL)bWithSelf {
    // Create the image context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
    
    // Get the snapshot
    UIImage *snapshotImage = nil;
    
#ifdef __IPHONE_7_0
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    if ([systemVersion rangeOfString:@"7"].length > 0 && !bWithSelf) {
        // 系统版本号包含 7
        // There he is! The new API method
        [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
        // Get the snapshot
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    }else{
#endif
        UIView *view = [[self.window subviews] objectAtIndex:0];
        self.hidden = !bWithSelf;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(context, 0, view.bounds.size.height);
        CGContextScaleCTM (context, 1, -1);
        CGContextClipToRect(context, [self convertRect:self.bounds toView:view]);
        [view.layer renderInContext:context];
        
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        self.hidden = NO;
#ifdef __IPHONE_7_0
    }
#endif
    
    // Be nice and clean your mess up
    UIGraphicsEndImageContext();
    
    return snapshotImage;
}

- (UIImage *)tt_screenShootSelf {//仅限ios5以上
    // Create the image context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
    
    // Get the snapshot
    UIImage *snapshotImage = nil;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    //    CGContextScaleCTM (context, 1, -1);
    [self.layer renderInContext:context];
    
    snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Be nice and clean your mess up
    UIGraphicsEndImageContext();
    
    return snapshotImage;
}

@end
