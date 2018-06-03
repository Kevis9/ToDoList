//
//  TaskModel.m
//  Task
//
//  Created by yu on 2018/6/2.
//  Copyright © 2018年 yu. All rights reserved.
//

#import "TaskModel.h"

@implementation TaskModel
+(TaskModel *)getTaskFromDB
{
    TaskModel *model;
    model = [[TaskModel alloc] init];//这里重写init方法，从数据库里面的到一个对象
    return model;
    
}//这个方法从本地数据库里面获一个任务model

-(instancetype) init   //instancetype是什么意思？
{
    self = [super init]; //这句话？
    if(self){
        self.title=@"默认任务";
        self.detail=@"默认任务描述";
        self.startTimeStamp = @"默认时间";
        self.endTimeStamp=@"默认时间";
        self.isCompleted =NO;
        
    }
    return self;
}
@end
