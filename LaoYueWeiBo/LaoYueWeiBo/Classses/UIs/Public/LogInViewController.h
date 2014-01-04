//
//  LogInViewController.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-4.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginVCDelegate;
@interface LogInViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *loginWebView;
@property (nonatomic, weak) id<LoginVCDelegate>delegate;

@end



@protocol LoginVCDelegate <NSObject>

- (void)loginViewController:(LogInViewController *)loginVC didLoginSuccessWithCode:(NSString *)code;

@end