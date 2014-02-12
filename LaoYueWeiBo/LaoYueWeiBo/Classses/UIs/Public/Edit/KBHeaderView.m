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
        [self initWordsNumLabel];
        
        [self initPhotoButton];
        [self initMentionButton];
        [self initTrendButton];
        [self initEmotionButton];
        [self initDoneButton];
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

//字数
- (void)initWordsNumLabel
{
    self.wordsNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(235, 8, 60, 20)];
    self.wordsNumLabel.textColor = GrayColor;
    self.wordsNumLabel.backgroundColor = LightGrayColor;
    self.wordsNumLabel.font = [UIFont systemFontOfSize:13];
    self.wordsNumLabel.textAlignment = NSTextAlignmentRight;
    self.wordsNumLabel.text = @"140";
    self.wordsNumLabel.backgroundColor = ClearColor;
    [self addSubview:self.wordsNumLabel];
}

static float gapWidth = 35.0f;
static float photoButton_y = 25.0f;
//相机
- (void)initPhotoButton
{
    self.photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.photoButton.frame = CGRectMake(photoButton_y, KBHeaderView_Heigth/2 + (KBHeaderView_Heigth/2-PhotoButton_Width)/2, PhotoButton_Width, PhotoButton_Width);
    [self.photoButton setBackgroundImage:ImageWithFile(@"edit_camerabutton_n.png") forState:UIControlStateNormal];
    [self addSubview:self.photoButton];
}

//@
- (void)initMentionButton
{
    self.mentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.mentionButton.frame = CGRectMake(photoButton_y+PhotoButton_Width+gapWidth, KBHeaderView_Heigth/2 + (KBHeaderView_Heigth/2-PhotoButton_Width)/2, PhotoButton_Width, PhotoButton_Width);
    [self.mentionButton setBackgroundImage:ImageWithFile(@"edit_mentionbutton_n.png") forState:UIControlStateNormal];
    [self addSubview:self.mentionButton];
}

//#
- (void)initTrendButton
{
    self.trendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.trendButton.frame = CGRectMake(photoButton_y+(PhotoButton_Width+gapWidth)*2, KBHeaderView_Heigth/2 + (KBHeaderView_Heigth/2-PhotoButton_Width)/2, PhotoButton_Width, PhotoButton_Width);
    [self.trendButton setBackgroundImage:ImageWithFile(@"edit_trendbutton_n.png") forState:UIControlStateNormal];
    [self addSubview:self.trendButton];
}

//表情
- (void)initEmotionButton
{
    self.emotionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.emotionButton.frame = CGRectMake(photoButton_y+(PhotoButton_Width+gapWidth)*3, KBHeaderView_Heigth/2 + (KBHeaderView_Heigth/2-PhotoButton_Width)/2, PhotoButton_Width, PhotoButton_Width);
    [self.emotionButton setBackgroundImage:ImageWithFile(@"edit_emoticonbutton_n.png") forState:UIControlStateNormal];
    [self addSubview:self.emotionButton];
}

//done
- (void)initDoneButton
{
    float doneButton_Height = 40.0f;
    float doneButton_Width = 82.0f;
    self.doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.doneButton.frame = CGRectMake(ScreenWidth-doneButton_Width, 39, doneButton_Width, doneButton_Height);
    [self.doneButton setTitle:@"弹回" forState:UIControlStateNormal];
    [self.doneButton setTitleColor:GrayColor forState:UIControlStateNormal];
    [self.doneButton setTitleColor:DarkGrayColor forState:UIControlStateHighlighted];
    [self addSubview:self.doneButton];
}

@end
