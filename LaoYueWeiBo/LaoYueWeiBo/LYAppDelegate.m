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

@implementation LYAppDelegate

/*
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
    
    //抽屉结构
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:self.tabBarController leftDrawerViewController:self.leftMenuVC];
    
    [self.drawerController setMaximumLeftDrawerWidth:LeftMenuWidth];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    self.window.rootViewController = self.drawerController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self initDrawerController];
    
    return YES;
}


@end
