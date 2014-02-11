//
//  LYAlbumButtomView.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-2-11.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "LYAlbumBottomView.h"

@implementation LYAlbumBottomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(0, 0, ScreenWidth, BottomView_Height);
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelButton setTitleColor:GrayColor forState:UIControlStateNormal];
        [self.cancelButton setTitleColor:LightGrayColor forState:UIControlStateHighlighted];
        [self addSubview:self.cancelButton];
    }
    return self;
}

@end
