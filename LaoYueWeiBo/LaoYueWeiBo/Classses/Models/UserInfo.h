//
//  UserInfo.h
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-17.
//  Copyright (c) 2014年 LYue. All rights reserved.
//
//  用户信息模型

#import <Foundation/Foundation.h>
#import "ModelsConstants.h"

@interface UserInfo : NSObject

@property (nonatomic, strong) NSString *ID;                   //用户id
@property (nonatomic, strong) NSString *name;                 //友好显示名称
@property (nonatomic, strong) NSString *screen_name;          //用户昵称
@property (nonatomic, strong) NSString *description;          //用户个人描述
@property (nonatomic, strong) NSString *url;                  //用户博客地址

@property (nonatomic, strong) NSString *profile_image_url;    //用户头像地址（中图），50×50像素
@property (nonatomic, strong) NSString *avatar_large;         //用户头像地址（大图），180×180像素
@property (nonatomic, strong) NSString *avatar_hd;            //用户头像地址（高清），高清头像原图

@property (nonatomic, strong) NSString *profile_url;          //用户的微博统一URL地址
@property (nonatomic, strong) NSString *gender;               //性别，m：男、f：女、n：未知

@property (nonatomic, assign) NSInteger followers_count;      //粉丝数
@property (nonatomic, assign) NSInteger friends_count;        //关注数
@property (nonatomic, assign) NSInteger statuses_count;       //微博数
@property (nonatomic, assign) NSInteger favourites_count;     //收藏数

@property (nonatomic, strong) NSString *created_at;           //用户创建（注册）时间
@property (nonatomic, assign) BOOL verified;                  //是否是微博认证用户，即加V用户，true：是，false：否
@property (nonatomic, assign) BOOL online_status;             //用户的在线状态，0：不在线、1：在线
@property (nonatomic, assign) BOOL follow_me;                 //该用户是否关注当前登录用户，true：是，false：否
@property (nonatomic, assign) NSInteger bi_followers_count;   //用户的互粉数

/**
 * @brief 初始化
 * @param dic 数据字典
 * @param type 数据来源（dic来自网络还是数据库）
 */
- (id)initWithUserInfoDic:(NSDictionary *)dic type:(ModelSourceType)type;

@end
