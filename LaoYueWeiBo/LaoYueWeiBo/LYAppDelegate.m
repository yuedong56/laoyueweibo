//
//  LYAppDelegate.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 13-12-22.
//  Copyright (c) 2013年 LYue. All rights reserved.
//

#import "LYAppDelegate.h"
#include "HomeViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "SquareViewController.h"
#import "MoreViewController.h"
#import "EditViewController.h"

@implementation LYAppDelegate

/**
 初始化抽屉结构
 */
- (void)initDrawerController
{
    //左侧菜单
    self.leftMenuVC = [LeftMenuViewController new];
    
    //tabBarController
    self.tabBarController = [UITabBarController new];
    
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:[MessageViewController new]];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:[MineViewController new]];
    UINavigationController *sqareNav = [[UINavigationController alloc] initWithRootViewController:[SquareViewController new]];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:[MoreViewController new]];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeNav,messageNav,mineNav,sqareNav,moreNav, nil];
    
    //右侧写微博
    UINavigationController *rightEditNav = [[UINavigationController alloc] initWithRootViewController:[EditViewController new]];
    
    //抽屉结构
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:self.tabBarController
                                                            leftDrawerViewController:self.leftMenuVC
                                                           rightDrawerViewController:rightEditNav];
    
    [self.drawerController setMaximumLeftDrawerWidth:LeftMenuWidth];
    [self.drawerController setMaximumRightDrawerWidth:RightEditWidth];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    self.window.rootViewController = self.drawerController;
}

/**
 初始化登录界面
 */
- (void)initLoginViewController
{
    LogInViewController *loginVC = [LogInViewController new];
    loginVC.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = nav;
}


#pragma mark - ProgressHUD

- (void)showProgressHUDWithText:(NSString *)text
{
    self.progressHUD = [[MBProgressHUD alloc] initWithWindow:self.window];
    self.progressHUD.labelText = text;
    [self.window addSubview:self.progressHUD];
    [self.progressHUD show:YES];
}

- (void)hideProgressHUDWithText:(NSString *)text
{
    [self.progressHUD hide:YES];
    [self.progressHUD removeFromSuperview];
    self.progressHUD = nil;
}

#pragma mark - LoginVC Delegate

- (void)loginViewControllerDidLoginSuccess:(LogInViewController *)loginVC
{
    [self initDrawerController];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    if ([LYUserDefaults getAccessToken])
    {
        [self initDrawerController];
        //缺个接口，检查 AccessToken 是否过期
    }
    else
    {
        [self initLoginViewController];
    }
    
    return YES;
}


@end
