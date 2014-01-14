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

@property (nonatomic, strong) ASIHTTPRequest *currentRequest;

/**
 * 
 */
+ (void)requestAccessTokenWithAuthorizeCode:(NSString *)authorizeCode
                                      block:(void(^)(NSString *jsonString, NSError *error))block;

@end
