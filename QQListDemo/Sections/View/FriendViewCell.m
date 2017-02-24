//
//  FriendViewCell.m
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import "FriendViewCell.h"
#import "FriendsModel.h"
@implementation FriendViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"qq";
    FriendViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[FriendViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        NSLog(@"创建一个cell");
    }
    return cell;
}


- (void)setFriends:(FriendsModel *)friends {
    _friends = friends;
    self.imageView.image = [UIImage imageNamed:_friends.icon];
    self.textLabel.text = _friends.name;
    self.detailTextLabel.text = _friends.intro;
    
    if (_friends.vip) {
        [self.textLabel setTextColor:[UIColor redColor]];
    } else {
        [self.textLabel setTextColor:[UIColor blackColor]];
    }
    self.textLabel.font=[UIFont systemFontOfSize:15.f];
    self.detailTextLabel.font=[UIFont systemFontOfSize:10.f];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
