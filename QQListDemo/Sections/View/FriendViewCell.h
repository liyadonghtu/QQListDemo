//
//  FriendViewCell.h
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendsModel;

@interface FriendViewCell : UITableViewCell

@property (nonatomic, strong) FriendsModel * friends;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
