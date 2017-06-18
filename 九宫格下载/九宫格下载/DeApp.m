//
//  DeApp.m
//  九宫格下载
//
//  Created by xiongtao on 17/6/18.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import "DeApp.h"

@implementation DeApp

-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self=[super init]){
        self.img=dic[@"img"];
        self.desc=dic[@"desc"];
    }
    return self;
}
+(instancetype)appWithDic:(NSDictionary *)dic{

    return [[self alloc] initWithDic:dic];
}
@end
