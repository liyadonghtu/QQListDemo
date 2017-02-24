//
//  QQGroupModel.h
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQGroupModel : NSObject
///名称属性
@property (nonatomic, copy) NSString *name;

///在线人数
@property (nonatomic, copy) NSString *online;

///好友列表
@property (nonatomic, strong) NSArray *friends;

//当前组是否打开
@property (nonatomic, assign) BOOL isOpen;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)qqGroupModelWithDict:(NSDictionary *)dict;

@end
