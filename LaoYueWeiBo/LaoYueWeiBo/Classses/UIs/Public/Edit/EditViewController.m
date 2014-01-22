//
//  EditViewController.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-12.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#define KeyboardAnimationDuration 0.25f
#define WBTextView_Width 275.0f

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
    [self addKeyBoardHeaderView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    [_weiboTextView performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.3f];
}

- (void)viewWillDisappear:(BOOL)animated
{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //键盘消失时子视图的动画
    [UIView animateWithDuration:KeyboardAnimationDuration animations:^{
        [self setSubViewsFrameWithKeyBoard_y:ScreenHeight];
    }];
    //键盘取消
    [_weiboTextView resignFirstResponder];
}

//设置导航栏
- (void)setNavBarView
{
    self.titleLabel.text = @"写微博";
}

//文本框
- (void)addWeiboTextView
{
    _weiboTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, IOS7AndLater?74:10, WBTextView_Width, 0)];
    _weiboTextView.backgroundColor = LightGrayColor;
    _weiboTextView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:_weiboTextView];
}

//键盘HeaderView
- (void)addKeyBoardHeaderView
{
    _kbHeaderView = [[KBHeaderView alloc] initWithFrame:CGRectMake(0, ScreenHeight-KBHeaderView_Heigth-(IOS7AndLater?0:64), ScreenWidth, KBHeaderView_Heigth)];
    _kbHeaderView.backgroundColor = GrayColor;
    [self.view addSubview:_kbHeaderView];
}

#pragma mark - KeyBoard Notificition
- (void)keyboardWillShow:(NSNotification *)noti
{
    [UIView animateWithDuration:[[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]
                     animations:^
    {
        CGPoint kbOrigin = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin;
        [self setSubViewsFrameWithKeyBoard_y:kbOrigin.y];
    }];
}

- (void)keyboardWillHide:(NSNotification *)noti
{
    [UIView animateWithDuration:[[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]
                     animations:^
    {
        [self setSubViewsFrameWithKeyBoard_y:ScreenHeight];
    }];
}

/**
 * @brief 根据键盘的纵坐标改变子视图的位置
 */
- (void)setSubViewsFrameWithKeyBoard_y:(float)keyBoard_y
{
    float kbHeaderView_y = keyBoard_y-KBHeaderView_Heigth-(IOS7AndLater?0:64);
    _kbHeaderView.frame = CGRectMake(0, kbHeaderView_y, ScreenWidth, KBHeaderView_Heigth);
    float weiboTextView_y = IOS7AndLater?74:10;
    _weiboTextView.frame = CGRectMake(20, weiboTextView_y, WBTextView_Width, kbHeaderView_y-weiboTextView_y-10);
}

@end
