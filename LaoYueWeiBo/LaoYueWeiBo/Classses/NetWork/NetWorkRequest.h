//
//  NetWorkRequest.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-13.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@interface NetWorkRequest : NSObject

/**
 * @brief 获取授权过的 Access_Token、uid
 * @param authorizeCode 登录页面返回的code
 */
+ (void)requestAccessTokenWithAuthorizeCode:(NSString *)authorizeCode
                                      block:(void(^)(NSString *jsonString, NSError *error))block;

@end
