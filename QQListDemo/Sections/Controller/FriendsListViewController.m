//
//  FriendsListViewController.m
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import "FriendsListViewController.h"
#import "QQGroupModel.h"
#import "FriendViewCell.h"
#import "FriendsModel.h"
#import "HeaderView.h"
@interface FriendsListViewController ()<HeaderViewDelegate>


@property (nonatomic, strong) NSArray *groupFriends;


@end

@implementation FriendsListViewController

- (NSArray *)groupFriends {
    if (_groupFriends == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"FriendsList.plist" ofType:nil];
        NSArray *arrayM = [NSArray arrayWithContentsOfFile:fullPath];
        
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:arrayM.count];
        for (NSDictionary *dict in arrayM) {
            QQGroupModel *group = [QQGroupModel qqGroupModelWithDict:dict];
            [models addObject:group];
        }
        _groupFriends = [models copy];
    }
    return _groupFriends;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 100;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 设置数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupFriends.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    QQGroupModel *group = self.groupFriends[section];
    if (group.isOpen) {
        return group.friends.count;
    } else {
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FriendViewCell *cell = [FriendViewCell cellWithTableView:tableView];
    
    QQGroupModel *group = self.groupFriends[indexPath.section];
    FriendsModel *friends = group.friends[indexPath.row];
    cell.friends = friends;
    
    return cell;
}

#pragma mark - 代理方法
// 当一个分组标题进入视野的时候就会调用该方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //    //    1.创建头部视图
    //    UIView *view = [[UIView alloc] init];
    //    view.backgroundColor = [UIColor grayColor];
    //    //    2.返回头部视图
    //    return view;
    
    //创建自定义的头部视图
    HeaderView *headerview=[HeaderView headerWithTableView:tableView];
    
    //设置当前控制器为代理
    headerview.delegate = self;
    //设置头部视图的数据
    QQGroupModel *groupmodel=self.groupFriends[section];
    headerview.qqGroup = groupmodel;
    //返回头部视图
    return headerview;
}


#pragma mark - YYHeaderViewDelegate
-(void)headerViewDidClickHeaderView:(HeaderView *)headerView
{
    //重新调用数据源的方法刷新数据
    [self.tableView reloadData];
}
//设置分组头部标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

#pragma mark  隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}






@end
