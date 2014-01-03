//
//  LeftMenuCell.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-3.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "LeftMenuCell.h"

@implementation LeftMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //标题
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, LeftMenuWidth-20, 44)];
        self.titleLabel.backgroundColor = ClearColor;
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = LightGrayColor;
        self.titleLabel.text = @"测试";
        [self addSubview:self.titleLabel];
        
        //分割线
        UIView *lineVeiw = [[UIView alloc] initWithFrame:CGRectMake(30, 43.6, ScreenWidth-30, 1)];
        lineVeiw.backgroundColor = COLOR_F(0.27);
        [self addSubview:lineVeiw];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    if (selected) {
        self.titleLabel.textColor = COLOR_F(0.85);
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    } else {
        self.titleLabel.textColor = LightGrayColor;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    }
}

@end
