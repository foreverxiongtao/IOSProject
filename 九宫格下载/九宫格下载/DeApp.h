//
//  DeApp.h
//  九宫格下载
//
//  Created by xiongtao on 17/6/18.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeApp : NSObject

@property(nonatomic,copy) NSString *img;
@property(nonatomic,copy) NSString *desc;

-(instancetype) initWithDic:(NSDictionary *)dic;
+(instancetype) appWithDic:(NSDictionary *)dic;
@end
