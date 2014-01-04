//
//  LogInViewController.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-4.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "LogInViewController.h"

@implementation LogInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //导航栏
    UIView *navBgView = [[UIView alloc] initWithFrame:CGRectMake(0, IsIOS7AndLater?-20:0, ScreenWidth, IsIOS7AndLater?64:44)];
    navBgView.backgroundColor = GrayColor;
    navBgView.alpha = IsIOS7AndLater?0.5:1;
    [self.navigationController.navigationBar addSubview:navBgView];
    
    //导航栏标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    titleLabel.backgroundColor = ClearColor;
    titleLabel.textColor = WhiteColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"登录";
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.navigationController.navigationBar addSubview:titleLabel];
    
    //webView
    self.loginWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-(IsIOS7AndLater?0:64))];
    self.loginWebView.delegate = self;
    [self.view addSubview:self.loginWebView];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",AppKey,RedirectUri]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.loginWebView loadRequest:request];
    
    //
    [APP_DELEGATE showProgressHUDWithText:nil];
}

#pragma mark - UIWebView Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    CLog(@"%s",__FUNCTION__);
    NSString *str = [[request URL] absoluteString];
    NSRange range = [str rangeOfString:@"?code="];
    if(range.location != NSNotFound)
    {
        NSString *code = [str substringFromIndex:range.location + 6];
        CLog(@"str ===== %@ , code ==== %@",str,code);
        [self.delegate loginViewController:self didLoginSuccessWithCode:code];
        return  NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    CLog(@"%s",__FUNCTION__);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CLog(@"%s",__FUNCTION__);
    [APP_DELEGATE hideProgressHUDWithText:nil];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    CLog(@"%s",__FUNCTION__);
}

@end
