//
//  EditViewController.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-12.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavBarView];
}

//设置导航栏
- (void)setNavBarView
{
    self.titleLabel.text = @"写微博";
}

@end
