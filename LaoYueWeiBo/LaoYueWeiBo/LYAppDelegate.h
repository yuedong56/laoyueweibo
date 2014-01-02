//
//  LYAppDelegate.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 13-12-22.
//  Copyright (c) 2013年 LYue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "LeftMenuViewController.h"

@interface LYAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MMDrawerController *drawerController;
@property (strong, nonatomic) LeftMenuViewController *leftMenuVC;
@property (strong, nonatomic) UITabBarController *tabBarController;
@end
