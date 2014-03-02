//
//  LYAlbumCell.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-2-11.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "LYAlbumCell.h"

@implementation LYAlbumCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.photoImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.photoImageButton.frame = CGRectMake(0, 0, AlbumCell_Width, AlbumCell_Width);
        [self addSubview:self.photoImageButton];
        
        self.markImageView = [[UIImageView alloc] initWithFrame:CGRectMake(AlbumCell_Width*0.6, AlbumCell_Width*0.6, 22, 22)];
        [self addSubview:self.markImageView];
    }
    return self;
}

@end
