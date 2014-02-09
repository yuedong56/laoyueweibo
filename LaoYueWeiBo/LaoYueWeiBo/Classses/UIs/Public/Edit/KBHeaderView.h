//
//  KBHeaderView.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-21.
//  Copyright (c) 2014年 LYue. All rights reserved.
//
//  键盘上部的 HeaderView

#define KBHeaderView_Heigth 80.0f
#define LocateButton_Height 25.0f
#define PhotoButton_Width 24.0f

#import <UIKit/UIKit.h>

@interface KBHeaderView : UIView

@property (nonatomic, strong) UIButton *locateButton;  //位置按钮
@property (nonatomic, strong) UILabel *wordsNumLabel;  //字数

@property (nonatomic, strong) UIButton *photoButton;   //拍张按钮
@property (nonatomic, strong) UIButton *mentionButton; //@
@property (nonatomic, strong) UIButton *trendButton;   //#
@property (nonatomic, strong) UIButton *emotionButton; //表情
@property (nonatomic, strong) UIButton *doneButton;    //done

@end
