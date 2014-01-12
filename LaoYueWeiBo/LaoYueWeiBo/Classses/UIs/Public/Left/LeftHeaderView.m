//
//  LeftHeaderView.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-3.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "LeftHeaderView.h"

@implementation LeftHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //头像
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((LeftMenuWidth-HeaderImageWidth)/2, IOS7AndLater?35:25, HeaderImageWidth, HeaderImageWidth)];
        self.imageView.backgroundColor = BlackColor;
        self.imageView.layer.cornerRadius = HeaderImageWidth/2;
        [self addSubview:self.imageView];

        //用户名
        float y = self.imageView.frame.origin.y + self.imageView.frame.size.height + 5;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, y, LeftMenuWidth, 44)];
        self.titleLabel.backgroundColor = ClearColor;
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = WhiteColor;
        self.titleLabel.text = @"用户名";
        [self addSubview:self.titleLabel];
    }
    return self;
}

@end
