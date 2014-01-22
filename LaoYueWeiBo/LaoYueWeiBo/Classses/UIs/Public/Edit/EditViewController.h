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

@interface EditViewController : BaseViewController

@property (nonatomic, strong) UITextView *weiboTextView;
@property (nonatomic, strong) KBHeaderView *kbHeaderView;

@end
