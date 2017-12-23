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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [UIButton tt_testButtonWithType:UIButtonTypeCustom inView:self.view touchUpInsideActionBlock:^(id sender) {
        [self alert];
    }];
    
    
    
}

-(void)alert
{
    UIAlertController * alert = [UIAlertController tt_alertControllerWithTitle:@"" titleColor:nil message:@"提示内容" cancleTitle:@"取消" cancleTitleColor:[UIColor blueColor] canclehandler:^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor redColor];
    } commitTitle:@"确定" commitTitleColor:[UIColor greenColor] commithandler:^(UIAlertAction *action) {
        self.view.backgroundColor = [UIColor greenColor];
    }];
    
    [alert show:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
