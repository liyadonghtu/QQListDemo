//
//  FriendsModel.h
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsModel : NSObject

/**
 *  每个好友的名称
 */
@property(nonatomic,copy)NSString *name;
/**
 *每个好友的头像
 */
@property(nonatomic,copy)NSString *icon;
/**
 *  每个好友的个性签名
 */
@property(nonatomic,copy)NSString *intro;
/**
 *  该好友是否是vip
 */
@property(nonatomic,assign)BOOL vip;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)friendsWithDict:(NSDictionary *)dict;
@end
