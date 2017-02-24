//
//  HeaderView.h
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQGroupModel.h"

@class HeaderView;

@protocol HeaderViewDelegate <NSObject>

-(void)headerViewDidClickHeaderView:(HeaderView *)headerView;

@end



@interface HeaderView : UITableViewHeaderFooterView

@property(nonatomic,strong) QQGroupModel *qqGroup;
+(instancetype)headerWithTableView:(UITableView *)tableView;
@property(nonatomic,weak)id<HeaderViewDelegate> delegate;

@end
