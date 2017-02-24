//
//  HeaderView.m
//  QQListDemo
//
//  Created by 李亚东 on 2017/2/23.
//  Copyright © 2017年 李亚东. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView ()

@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UILabel *lab;

@end


@implementation HeaderView

+(instancetype)headerWithTableView:(UITableView *)tableView {

    static NSString *indentifier=@"header";
    //先到缓存池中去取数据
    HeaderView *headerview = (HeaderView *)[tableView dequeueReusableCellWithIdentifier:indentifier];
    //如果没有，则自己创建
    if (headerview == nil) {
        headerview = [[HeaderView alloc]initWithReuseIdentifier:indentifier];
    }
    //返回一个头部视图
    return headerview;
}

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    //初始化父类中的构造方法
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //创建一个按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置按钮的属性
        //设置普通状态下按钮的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        //设置高亮状态下按钮的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        
        //设置按钮上的小三角图片
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        //设置按钮上信息的对其方式为左对齐
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        //设置小三角图片的内边距
        btn.contentEdgeInsets=UIEdgeInsetsMake(0, 20, 0, 0);
        //设置按钮上文字距离小三角图片的距离
        btn.titleEdgeInsets=UIEdgeInsetsMake(0, 20, 0, 0);
        //设置按钮上分组标题的文本颜色（默认是白色）
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //添加按钮的点击事件
        [btn addTarget:self action:@selector(btnOnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 设置btn中的图片不填充整个imageview
        btn.imageView.contentMode = UIViewContentModeCenter;
        // 超出范围的图片不要剪切
        // btn.imageView.clipsToBounds = NO;
        btn.imageView.layer.masksToBounds = NO;
        
        //把按钮添加到视图
        [self addSubview:btn];
        self.btn=btn;
        
        //创建一个lab
        UILabel *lab=[[UILabel alloc]init];
        //设置在线人数的对齐方式为右对齐
        lab.textAlignment=NSTextAlignmentRight;
        //设置在线人数的文本颜色为灰色
        lab.textColor=[UIColor grayColor];
        [self addSubview:lab];
        self.lab=lab;
    }
    return self;
}


-(void)btnOnclick:(UIButton *)btn
{
    NSLog(@"按钮被点击了");
    //修改模型的isopen属性
    //1.修改模型数据
    self.qqGroup.isOpen = !self.qqGroup.isOpen;
    //2.刷新表格
    //（刷新表格的功能由控制器完成，在这里可以设置一个代理），当按钮被点击的时候，就通知代理对表格进行刷新
    //通知代理
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickHeaderView:)]) {
        [self.delegate headerViewDidClickHeaderView:self];
    }
}

//当控件的frame值改变时，会自动调用该方法，故可以在该方法中设置控件的frame;
-(void)layoutSubviews {
     [super layoutSubviews];
    //设置按钮的frame和头部视图一样大小
    self.btn.frame=self.bounds;
    
    //设置lab的frame
    CGFloat padding=20;
    CGFloat labW=50;
    CGFloat labH=self.frame.size.height;
    CGFloat labY=0;
    CGFloat labX=self.frame.size.width-padding-labW;
    self.lab.frame=CGRectMake(labX, labY, labW, labH);
}

#pragma mark - 当一个控件被添加到其它视图上的时候会调用以下方法
// 已经被添加到父视图上的时候会调用
- (void)didMoveToSuperview
{
    NSLog(@"已经添加到视图了");
    // 在这个方法中就快要拿到最新的被添加到tableview上的头部视图修改它的图片
    if (self.qqGroup.isOpen) {
        //让小三角图片向下旋转
        self.btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
}

// 即将被添加到父视图上的时候会调用
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"将要添加到视图了");
}


//重写get方法，设置数据

- (void)setQqGroup:(QQGroupModel *)qqGroup {
    _qqGroup = qqGroup;
    //设置分组标题
    
    //self.btn.titleLabel.text=_group.name;
    [self.btn setTitle:_qqGroup.name forState:UIControlStateNormal];
    NSLog(@"%@",self.btn.titleLabel.text);
    //设置在线人数
    self.lab.text=[NSString stringWithFormat:@"%@/%lu",_qqGroup.online,(unsigned long)_qqGroup.friends.count];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
