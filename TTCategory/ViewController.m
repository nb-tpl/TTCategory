//
//  ViewController.m
//  TTCategory
//
//  Created by tiperTan on 2017/12/18.
//  Copyright © 2017年 tiperTan. All rights reserved.
//

#import "ViewController.h"

#import "UIButton+tt_category.h"
#import "UIAlertController+tt_category.h"
#import "NSObject+tt_category.h"
#import "UIColor+tt_category.h"
#import "UIView+tt_category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor tt_getHexColor:@"14172B"];
    [UIButton tt_testButtonWithType:UIButtonTypeCustom inView:self.view touchUpInsideActionBlock:^(id sender) {
        [self alert];
    }];
    
    [self loadHeadView];
}

- (void)loadHeadView
{
    UIImageView * imageBackView = [[UIImageView alloc] initWithFrame:CGRectMake(0,point2IP6_PT(64),ScreenWidth,point2IP6_PT(246))];
    imageBackView.image = [UIImage imageNamed:@"common_bg_changjing.png"];
    [self.view addSubview:imageBackView];
    
    UIImageView * circle = [[UIImageView alloc] initWithFrame:CGRectMake(0,point2IP6_PT(64),point2IP6_PT(190),point2IP6_PT(167))];
    circle.center = CGPointMake(imageBackView.tt_sizeCenterX,imageBackView.tt_height - point2IP6_PT(42) - circle.tt_height/2.0f);
    circle.image = [UIImage imageNamed:@"motortrip_circle.png"];
    [imageBackView addSubview:circle];

}

-(void)alert
{
   void (^callPhone)(UIAlertAction *action)  =  ^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor redColor];
   };
    void (^callWebChat)(UIAlertAction *action)  =  ^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor redColor];
    };

    
    UIAlertController * alert = [UIAlertController tt_actionSheetControllerWithTitles:nil titleColor:nil message:nil subTitles:@[@"打电话",@"微信"] subTitleColor:@[[UIColor blackColor],[UIColor blackColor]] subhandlers:@[callPhone,callWebChat] cancleTitle:@"取消" cancleTitleColor:[UIColor blueColor] canclehandler:^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor redColor];
    }];
    [alert show:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
