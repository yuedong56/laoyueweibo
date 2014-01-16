//
//  NetWorkRequest.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-13.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

/**
 * @brief 检查网络，若网络不可用则弹出提示
 */
+ (BOOL)checkNetWorkStateAndShowAlertView
{
    if (![LYUtils checkNetworkAvailable]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"当前网络不可用！"
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"确定", nil];
        [alertView show];
        return NO;
    } else {
        return YES;
    }
}


/**
 * @brief 获取授权过的Access Token
 * @param authorizeCode 登录页面返回的code
 */
+ (void)requestAccessTokenWithAuthorizeCode:(NSString *)authorizeCode
                                      block:(void(^)(NSString *jsonString, NSError *error))block
{
    if (![self checkNetWorkStateAndShowAlertView]) {
        return;
    }
    
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/access_token?client_id=%@&client_secret=%@&grant_type=authorization_code&code=%@&redirect_uri=%@",AppKey,AppSecret,authorizeCode,RedirectUri];
    NSURL *url = [NSURL URLWithString:urlStr];
    __unsafe_unretained __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    
    [request setCompletionBlock:^{
        if ([request error]) {
            block(nil,[request error]);
        } else {
            block([request responseString],nil);
        }
    }];
    
    [request setFailedBlock:^{
        block(nil,[request error]);
    }];
    
    [request startAsynchronous];
}

@end
