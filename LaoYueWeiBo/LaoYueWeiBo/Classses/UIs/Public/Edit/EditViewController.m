//
//  EditViewController.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-12.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#define KeyboardAnimationDuration 0.25f
#define AlbumAnimationDuration 0.5f
#define WBTextView_Width 275.0f

#import "EditViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface EditViewController ()
{
    float _kbHeaderView_y;
}
@end

@implementation EditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    
    [self setNavBarView];
    [self initWeiboTextView];
    [self initKeyBoardHeaderView];
    
    [self addTarget];
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
    //键盘取消
    [_weiboTextView resignFirstResponder];
    //
    [self dismissAlbumView];
}

//设置导航栏
- (void)setNavBarView
{
    self.titleLabel.text = @"写微博";
}

//文本框
- (void)initWeiboTextView
{
    _weiboTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, IOS7AndLater?74:10, WBTextView_Width, 0)];
    _weiboTextView.backgroundColor = LightGrayColor;
    _weiboTextView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:_weiboTextView];
}

//键盘HeaderView
- (void)initKeyBoardHeaderView
{
    _kbHeaderView = [[KBHeaderView alloc] initWithFrame:CGRectMake(0, ScreenHeight-KBHeaderView_Heigth-(IOS7AndLater?0:64), ScreenWidth, KBHeaderView_Heigth)];
    _kbHeaderView.backgroundColor = WhiteColor;
    [self.view addSubview:_kbHeaderView];
}

//增加方法
- (void)addTarget
{
    [_kbHeaderView.photoButton addTarget:self action:@selector(photoButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [_kbHeaderView.mentionButton addTarget:self action:@selector(mentionButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [_kbHeaderView.trendButton addTarget:self action:@selector(trendButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [_kbHeaderView.emotionButton addTarget:self action:@selector(emotionButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [_kbHeaderView.doneButton addTarget:self action:@selector(doneButtonPress:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Button Events
- (void)photoButtonPress:(UIButton *)button
{
    [self.weiboTextView resignFirstResponder];
    UIActionSheet *actSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"照相机",@"相册", nil];
    [actSheet showInView:self.view];
}

- (void)mentionButtonPress:(UIButton *)button
{
    
}

- (void)trendButtonPress:(UIButton *)button
{
    
}

- (void)emotionButtonPress:(UIButton *)button
{
    
}

- (void)doneButtonPress:(UIButton *)button
{
    [self.weiboTextView resignFirstResponder];
    [self dismissAlbumView];
}

- (void)albumCancelButtonPress:(UIButton *)button
{
    [self dismissAlbumView];
}

#pragma mark - KeyBoard Notificition
- (void)keyboardWillShow:(NSNotification *)noti
{
    [self dismissAlbumView];

    [UIView animateWithDuration:[[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]
                     animations:^
    {
        CGPoint kbOrigin = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin;
        [self setSubViewsFrameWithKeyBoard_y:kbOrigin.y];
        _kbHeaderView_y = kbOrigin.y;
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

//弹出相册页面
- (void)presentAlbumView
{
    if (self.albumView) {
        return;
    }
    
    self.albumView = [[LYAlbumView alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight)];
    self.albumView.delegate = self;
    [self.view.window addSubview:self.albumView];
    
    [UIView animateWithDuration:AlbumAnimationDuration animations:^{
        [self setSubViewsFrameWithKeyBoard_y:_kbHeaderView_y];
    }];
    
    float albumView_y = _kbHeaderView.frame.origin.y+_kbHeaderView.frame.size.height + (IOS7AndLater?0:64);
    [UIView animateWithDuration:AlbumAnimationDuration animations:^{
        self.albumView.frame = CGRectMake(0, albumView_y, ScreenWidth, ScreenHeight);
    }];
    
    [self.albumView.bottomView.cancelButton addTarget:self action:@selector(albumCancelButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    //生成整个photolibrary句柄的实例
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop)
    {
         [group enumerateAssetsUsingBlock:^(ALAsset *resultAlAsset, NSUInteger index, BOOL *stop)
         {
              NSString* assetType = [resultAlAsset valueForProperty:ALAssetPropertyType];
              if ([assetType isEqualToString:ALAssetTypePhoto]) {
                  CLog(@"Photo");
                  //如果是照片就存入
                  UIImage *image = [[UIImage alloc] initWithCGImage:resultAlAsset.thumbnail];
                  [self.albumView.mediaArray addObject:image];
              }else if([assetType isEqualToString:ALAssetTypeVideo]){
                  CLog(@"Video");
              }else if([assetType isEqualToString:ALAssetTypeUnknown]){
                  CLog(@"Unknow AssetType");
              }
              
              [self.albumView reloadData];
          }];
     } failureBlock:^(NSError *error) {
         NSLog(@"Enumerate the asset groups failed.");
     }];
}

- (void)dismissAlbumView
{
    [UIView animateWithDuration:AlbumAnimationDuration animations:^{
        self.albumView.frame = CGRectMake(0, ScreenHeight, ScreenHeight, ScreenHeight);
        [self setSubViewsFrameWithKeyBoard_y:ScreenHeight];
    } completion:^(BOOL finished) {
        [self.albumView removeFromSuperview];
        self.albumView = nil;
    }];
}

#pragma mark - LYAlbumView Delegate
- (void)albumViewDidUpSwipe:(LYAlbumView *)albumView
{
    [UIView animateWithDuration:AlbumAnimationDuration animations:^{
        albumView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    }];
}

#pragma mark - UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0: { //照相机
            NSLog(@"0");
        } break;
        case 1: { //相册
            [self presentAlbumView];
        } break;
        default: break;
    }
}

@end
