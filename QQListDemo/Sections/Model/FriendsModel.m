//
//  FriendsModel.m
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel
-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)friendsWithDict:(NSDictionary *)dict {

    return [[self alloc] initWithDict:dict];
}
@end
