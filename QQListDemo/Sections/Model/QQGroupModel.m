//
//  QQGroupModel.m
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import "QQGroupModel.h"
#import "FriendsModel.h"
@implementation QQGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        //将字典转换为模型
        [self setValuesForKeysWithDictionary:dict];
        
        //定义一个数组用来保存转换后的模型
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:self.friends.count];
        for (NSDictionary *dict in self.friends) {
            
            FriendsModel *friends = [FriendsModel friendsWithDict:dict];
            [models addObject:friends];
            
        }
        
        self.friends = [models copy];
        
    }
    
    return self;
}

+ (instancetype)qqGroupModelWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}


@end
