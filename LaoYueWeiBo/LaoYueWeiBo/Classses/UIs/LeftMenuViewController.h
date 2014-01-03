//
//  LeftMenuViewController.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 13-12-25.
//  Copyright (c) 2013年 LYue. All rights reserved.
//

#define HeaderViewHeigth 160.0f
#define FooterViewHeigth 80.0f

#import <UIKit/UIKit.h>

@interface LeftMenuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) NSMutableArray *titleArray;

@end
