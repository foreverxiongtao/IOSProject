//
//  DeQuestion.m
//  GuessPicGame
//
//  Created by xiongtao on 17/6/25.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import "DeQuestion.h"

@implementation DeQuestion
-(instancetype)initWidhtDic:(NSDictionary *)dic{
    if(self=[super init]){
        
        self.icon=dic[@"icon"];
        self.title=dic[@"title"];
        self.answer=dic[@"answer"];
    }
    return self;
}

+(instancetype)questionWithDic:(NSDictionary *)dic{
    
    return  [[self alloc]initWidhtDic:dic];
}
@end
