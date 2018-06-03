//
//  ViewController.m
//  Task
//
//  Created by yu on 2018/6/2.
//  Copyright © 2018年 yu. All rights reserved.
//

#import "ViewController.h"
#import "TaskModel.h"
#import "TaskDetailView.h"
#import "SDAutoLayout.h"
@interface ViewController ()
@property (nonatomic,strong) UILabel *taskTitleLabel;
@property (nonatomic,strong) TaskDetailView *taskView;//这里定义一个你自己刚刚创建的view对象
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TaskModel *task = [TaskModel getTaskFromDB];//从数据库里面调取一个任务
    self.view.backgroundColor = [UIColor whiteColor];//这里的view指的是？？
    [self addSubviews];
    [self setupSubviewsLayout];
    [self updateTaskViewWith:task];
    
}
-(void)updateTaskViewWith:(TaskModel *)task
{
    self.taskView.detailLabel.text=task.detail;
    self.taskTitleLabel.text=task.title;
}
-(void)addSubviews
{
    [self.view addSubview:self.taskTitleLabel];//viewcontroller先把上面的标题加上去
    [self.view addSubview:self.taskView];//再把你自己创建的view添加进去,veiwcontrolller里面自带一个view，而你只是把自己的view加进去而已
}
-(void)setupSubviewsLayout
{
    self.taskTitleLabel.sd_layout
    .topSpaceToView(self.view, 20)
    .widthIs(200)
    .centerXEqualToView(self.view)//水平居中
    .autoHeightRatio(0);
    
    self.taskView.sd_layout//这个地方再对自己创建的view布局
    .topSpaceToView(self.view,64)
    .widthIs([UIScreen mainScreen].bounds.size.width-20)
    .heightIs(200)
    .centerXEqualToView(self.view);
    [self.taskView setupSubviewLayout];//当对整个view布局好后，再对这个view里面的组建进行好布局，有一个问题，为什么要用self？
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
