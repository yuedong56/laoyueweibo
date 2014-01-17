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
#import "LeftHeaderView.h"
#import "LeftFooterView.h"
#import "UserInfo.h"

@interface LeftMenuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *menuTableView;
@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) LeftHeaderView *headerView;
@property (nonatomic, strong) LeftFooterView *footerView;

/**
 * @brief 给用户头像、用户名赋数据
 */
- (void)setHeaderContentWithUserInfo:(UserInfo *)userInfo;

@end
