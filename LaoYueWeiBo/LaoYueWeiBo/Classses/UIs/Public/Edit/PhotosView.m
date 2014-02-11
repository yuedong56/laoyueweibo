//
//  PhotosView.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-2-11.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "PhotosView.h"

@implementation PhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.photosArray = [NSMutableArray arrayWithCapacity:9];
    }
    return self;
}

@end
