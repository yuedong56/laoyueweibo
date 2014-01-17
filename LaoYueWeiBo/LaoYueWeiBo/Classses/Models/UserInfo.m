//
//  UserInfo.m
//  LaoYueWeiBo
//
//  Created by 老岳 on 14-1-17.
//  Copyright (c) 2014年 LYue. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

- (id)initWithUserInfoDic:(NSDictionary *)dic type:(ModelSourceType)type
{
    self = [super init];
    if (self)
    {
        if (ModelSourceFromNetWork == type)
        {
            self.ID = [NSString stringWithFormat:@"%@",[dic valueForKey:@"id"]];
            self.name = [NSString stringWithFormat:@"%@",[dic valueForKey:@"name"]];
            self.screen_name = [NSString stringWithFormat:@"%@",[dic valueForKey:@"screen_name"]];
            self.description = [NSString stringWithFormat:@"%@",[dic valueForKey:@"description"]];
            self.url = [NSString stringWithFormat:@"%@",[dic valueForKey:@"url"]];
            
            self.profile_image_url = [NSString stringWithFormat:@"%@",[dic valueForKey:@"profile_image_url"]];
            self.avatar_large = [NSString stringWithFormat:@"%@",[dic valueForKey:@"avatar_large"]];
            self.avatar_hd = [NSString stringWithFormat:@"%@",[dic valueForKey:@"avatar_hd"]];
            
            self.profile_image_url = [NSString stringWithFormat:@"%@",[dic valueForKey:@"profile_image_url"]];
            self.gender = [NSString stringWithFormat:@"%@",[dic valueForKey:@"gender"]];
            
            self.followers_count = [[dic valueForKey:@"followers_count"] integerValue];
            self.friends_count = [[dic valueForKey:@"friends_count"] integerValue];
            self.statuses_count = [[dic valueForKey:@"statuses_count"] integerValue];
            self.favourites_count = [[dic valueForKey:@"favourites_count"] integerValue];
            
            self.created_at = [NSString stringWithFormat:@"%@",[dic valueForKey:@"created_at"]];
            self.verified = [[dic valueForKey:@"verified"] integerValue];
            self.online_status = [[dic valueForKey:@"online_status"] integerValue];
            self.follow_me = [[dic valueForKey:@"follow_me"] integerValue];
            self.bi_followers_count = [[dic valueForKey:@"bi_followers_count"] integerValue];
        }
        else
        {
            
        }
    }
    return self;
}

@end
