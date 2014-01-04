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
#import "LogInViewController.h"
#import "MBProgressHUD.h"

@interface LYAppDelegate : UIResponder <UIApplicationDelegate,LoginVCDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MMDrawerController *drawerController;
@property (strong, nonatomic) LeftMenuViewController *leftMenuVC;
@property (strong, nonatomic) UITabBarController *tabBarController;

@property (nonatomic, strong) MBProgressHUD *progressHUD;

- (void)showProgressHUDWithText:(NSString *)text;
- (void)hideProgressHUDWithText:(NSString *)text;

@end
