//
//  DeQuestion.h
//  GuessPicGame
//
//  Created by xiongtao on 17/6/25.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeQuestion : NSObject
@property(copy,nonatomic) NSString *icon;
@property(copy,nonatomic)NSString *answer;
@property(copy,nonatomic)NSString *title;

+(instancetype) questionWithDic:(NSDictionary *)dic;
-(instancetype) initWidhtDic:(NSDictionary *)dic;
@end
