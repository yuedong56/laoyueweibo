//
//  LeftMenuViewController.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 13-12-25.
//  Copyright (c) 2013年 LYue. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "LeftMenuCell.h"
#import "UIImageView+WebCache.h"

@implementation LeftMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //背景色
    self.view.backgroundColor = DarkGrayColor;
    //数据
    
    //列表
    [self initMenuTableView];
}

- (void)initMenuTableView
{
    self.menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-(IOS7AndLater?0:20)) style:UITableViewStylePlain];
    self.menuTableView.separatorColor = ClearColor;
    self.menuTableView.backgroundColor = ClearColor;
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    [self.view addSubview:self.menuTableView];
    
    //headerView
    self.headerView = [[LeftHeaderView alloc] initWithFrame:CGRectMake(0, 0, LeftMenuWidth, HeaderViewHeigth)];
    self.headerView.backgroundColor = LightGrayColor;
    self.menuTableView.tableHeaderView = self.headerView;
    
    //footerView
    self.footerView = [[LeftFooterView alloc] initWithFrame:CGRectMake(0, 0, LeftMenuWidth, FooterViewHeigth)];
    self.footerView.backgroundColor = LightGrayColor;
    self.menuTableView.tableFooterView = self.footerView;
}

- (void)setHeaderContentWithUserInfo:(UserInfo *)userInfo
{
    [self.headerView.imageView setImageWithURL:[NSURL URLWithString:userInfo.profile_image_url]
                              placeholderImage:nil];
    self.headerView.titleLabel.text = userInfo.screen_name;
}

#pragma mark - UITableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
//    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    LeftMenuCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[LeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = DarkGrayColor;
    cell.contentView.backgroundColor = DarkGrayColor;
    
    //选中颜色
    UIView *selectedBgView = [[UIView alloc] init];
    selectedBgView.backgroundColor = COLOR_F(0.2);
    cell.selectedBackgroundView = selectedBgView;
    
    return cell;
}

@end
