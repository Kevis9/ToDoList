//
//  TaskDetailView.m
//  Task
//
//  Created by yu on 2018/6/2.
//  Copyright © 2018年 yu. All rights reserved.
//

#import "TaskDetailView.h"
#import "SDAutoLayout.h"
@interface TaskDetailView ()
{
    UILabel *detailTitileLable;
    UILabel *endTimeTitileLabel;
    UILabel *statusTitleLabel;//因为这三个属性都是封闭的，所以在这里加了几个属性在这个类里面，而且没有暴露
    
}//声明这些属性，也就是把这些组件加进去了？？？
@end

@implementation TaskDetailView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self;
    
}
 -(void)setupSubview//这个方法用来初始化这些组件
{
    detailTitileLable=[UILabel new];
    detailTitileLable.text=@"任务描述";
    detailTitileLable.font=[UIFont systemFontOfSize:24];
    detailTitileLable.textColor=[UIColor blackColor];
    
    endTimeTitileLabel=[UILabel new];
    endTimeTitileLabel.text=@"截止时间";
    endTimeTitileLabel.font=[UIFont systemFontOfSize:24];
    endTimeTitileLabel.textColor=[UIColor blackColor];
    
    statusTitleLabel = [UILabel new];
    statusTitleLabel.text = @"任务状态";
    statusTitleLabel.font = [UIFont systemFontOfSize:24];
    statusTitleLabel.textColor = [UIColor blackColor];
}
//当初始化完成以后，就可以布局，这个布局的方法暴露出来是为了让viewcontroller先对这个view布局好
-(void)setupSubviewLayout
{
    detailTitileLable.sd_layout
    .topSpaceToView(self,5)
    .leftSpaceToView(self, 5)
    .widthIs(120)
    .heightIs(30);
    
    self.detailLabel.sd_layout//为什么这里要加self？？
    .topSpaceToView(detailTitileLable, 10)
    .leftEqualToView(detailTitileLable)
    .widthIs(self.frame.size.width-10)//这里的frame代表的是什么？
    .autoHeightRatio(0);//自动调整高度
    
    statusTitleLabel.sd_layout
    .topSpaceToView(self.detailLabel,5)
    .leftEqualToView(detailTitileLable)
    .widthIs(self.frame.size.width-10)
    .heightIs(30);
    
    self.completedSefmentControl.sd_layout
    .topSpaceToView(statusTitleLabel,10)
    .leftEqualToView(detailTitileLable)
    .widthIs(self.frame.size.width-10)
    .autoHeightRatio(0);
    
    
    
}
#pragma mark gettet setter
//在这里做存取方法
-(UILabel *)detailLabel
{
    if(!_detailLabel){
        _detailLabel=[UILabel new];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.textColor=[UIColor blackColor];
    }
    return _detailLabel;
}
-(UILabel *)endTimeLabel
{
    if (!_endTimeLabel) {
        _endTimeLabel = [UILabel new];
        _endTimeLabel.font = [UIFont systemFontOfSize:15];
        _endTimeLabel.textColor = [UIColor blackColor];
    }
    
    return _endTimeLabel;
}
-(UISegmentedControl *)completedSegmentControl
{
    if (!_completedSefmentControl) {
        _completedSefmentControl = [UISegmentedControl new];
        
    }
    return _completedSefmentControl;
}
@end

