//
//  DeAppView.h
//  九宫格下载
//
//  Created by tao xiong on 17/6/19.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeApp.h"
@interface DeAppView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *ivIcong;
@property (strong, nonatomic) IBOutlet UILabel *lbDesc;
@property(strong,nonatomic) DeApp *app;
- (IBAction)btnDownload:(UIButton *)sender;
-(instancetype) getDeAppView;
+(instancetype)appView;
@end
