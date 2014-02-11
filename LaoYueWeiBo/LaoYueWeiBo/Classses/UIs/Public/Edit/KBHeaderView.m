//
//  KBHeaderView.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-21.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "KBHeaderView.h"

@implementation KBHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initLocateButton];
        
    }
    return self;
}

//位置按钮
- (void)initLocateButton
{
    UIImage *tempBgImage_n = ImageWithFile(@"edit_locatebutton_n.png");
    UIImage *resultBgImage_n = [tempBgImage_n resizableImageWithCapInsets:UIEdgeInsetsMake(0, 22, 0, 22)];
    
    UIImage *tempBgImage_h = ImageWithFile(@"edit_locatebutton_h.png");
    UIImage *resultBgImage_h = [tempBgImage_h resizableImageWithCapInsets:UIEdgeInsetsMake(0, 22, 0, 22)];
    
    UIFont *buttonFont = [UIFont systemFontOfSize:12];
    
    NSString *buttonTitle = @"添加位置";
    CGSize size = [buttonTitle sizeWithFont:buttonFont
                          constrainedToSize:CGSizeMake(150, LocateButton_Height)
                              lineBreakMode:NSLineBreakByCharWrapping];
    
    self.locateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.locateButton setBackgroundImage:resultBgImage_n forState:UIControlStateNormal];
    [self.locateButton setBackgroundImage:resultBgImage_h forState:UIControlStateHighlighted];
    self.locateButton.frame = CGRectMake(10, 5, size.width+50, LocateButton_Height);
    self.locateButton.titleLabel.font = buttonFont;
    [self.locateButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 7)];
    [self.locateButton setTitleColor:LightGrayColor forState:UIControlStateNormal];
    [self.locateButton setTitleColor:GrayColor forState:UIControlStateHighlighted];
    [self.locateButton setTitle:buttonTitle forState:UIControlStateNormal];
    [self addSubview:self.locateButton];
}

@end
