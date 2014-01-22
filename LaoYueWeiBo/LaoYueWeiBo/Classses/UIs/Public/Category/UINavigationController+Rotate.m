//
//  UINavigationController+Rotate.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-22.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "UINavigationController+Rotate.h"

@implementation UINavigationController (Rotate)

#pragma mark - 屏幕旋转

//ios5.X
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

//ios6.X and later
- (BOOL)shouldAutorotate
{
    return NO;
}

//ios6.X and later
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
