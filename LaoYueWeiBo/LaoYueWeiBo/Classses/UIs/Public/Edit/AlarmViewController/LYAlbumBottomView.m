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
        self.backgroundColor = LightGrayColor;
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(0, 0, 80, BottomView_Height);
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelButton setTitleColor:WhiteColor forState:UIControlStateNormal];
        [self.cancelButton setTitleColor:DarkGrayColor forState:UIControlStateHighlighted];
        [self addSubview:self.cancelButton];
    }
    return self;
}

@end
