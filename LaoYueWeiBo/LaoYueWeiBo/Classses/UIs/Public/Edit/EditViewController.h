//
//  EditViewController.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-12.
//  Copyright (c) 2014年 LYue. All rights reserved.
//
//  写微博界面

#import "BaseViewController.h"
#import "KBHeaderView.h"
#import "PhotosView.h"
#import "LYAlbumView.h"

@interface EditViewController : BaseViewController<UIActionSheetDelegate,LYAlbumViewDelegate>

@property (nonatomic, strong) UITextView *weiboTextView;
@property (nonatomic, strong) KBHeaderView *kbHeaderView;
@property (nonatomic, strong) PhotosView *photesView;      //要添加的图片
@property (nonatomic, strong) LYAlbumView *albumView;      //相册页面

@end
