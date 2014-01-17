//
//  HomeViewController.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 13-12-25.
//  Copyright (c) 2013年 LYue. All rights reserved.
//

#import "HomeViewController.h"
#import "UserInfo.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //背景色
    self.view.backgroundColor = [UIColor colorWithRed:0.64 green:0.64 blue:0.64 alpha:1];
    
    [self startRequests];
}

//发起网络请求
- (void)startRequests
{
    //获取当前用户信息
    [NetWorkRequest requestUserInfoWithUID:[LYUserDefaults getUID]
                                     block:^(NSDictionary *jsonDic, NSError *error)
    {
        CLog(@"userInfo_jsonDic ===== %@",jsonDic);
        if (jsonDic)
        {
            UserInfo *userInfo = [[UserInfo alloc] initWithUserInfoDic:jsonDic type:ModelSourceFromNetWork];
            
            [APP_DELEGATE.leftMenuVC setHeaderContentWithUserInfo:userInfo];
        }
    }];
}

@end
