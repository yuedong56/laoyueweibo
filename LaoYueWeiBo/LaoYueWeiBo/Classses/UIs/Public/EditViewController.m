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
    self.view.backgroundColor = WhiteColor;
    
    [self setNavBarView];
    [self addWeiboTextView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [_weiboTextView performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.0f];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_weiboTextView resignFirstResponder];
}

//设置导航栏
- (void)setNavBarView
{
    self.titleLabel.text = @"写微博";
}

- (void)addWeiboTextView
{
    _weiboTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, IOS7AndLater?74:10, 280, 50)];
    _weiboTextView.backgroundColor = GrayColor;
    [self.view addSubview:_weiboTextView];
}

@end
