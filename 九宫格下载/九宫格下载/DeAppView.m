//
//  DeAppView.m
//  九宫格下载
//
//  Created by tao xiong on 17/6/19.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import "DeAppView.h"

@implementation DeAppView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void)setApp:(DeApp *)app{
    if(app!=nil){
        _ivIcong.image=[UIImage imageNamed:app.img];
        _lbDesc.text=app.desc;
    }
}
- (IBAction)btnDownload:(UIButton *)sender {
    sender.enabled=NO;
    
    UILabel *toast= [[UILabel alloc]init];
    toast.text=@"正在下载中...";
    toast.textAlignment=NSTextAlignmentCenter;
    toast.backgroundColor=[UIColor blackColor];
    toast.textColor=[UIColor whiteColor];
    //设置透明度
    toast.alpha=0;
    //设置圆角
    toast.layer.cornerRadius=5;
    toast.layer.masksToBounds=true;
    float toast_width=200;
    float toast_height=50;
    float x=(self.superview.frame.size.width-toast_width)*0.5;
    float y=(self.superview.frame.size.height-toast_height)/2;
    toast.frame=CGRectMake(x, y, toast_width, toast_height);
    [self.superview addSubview:toast];
    //设置toast的弹出和消失动画
    [UIView animateWithDuration:2 animations:^{
        toast.alpha=0.7;
    } completion:^(BOOL finished) {
        if(finished){
            [UIView animateWithDuration:2 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
                toast.alpha=0;
            } completion:^(BOOL finished) {
                if(finished){
                    [toast removeFromSuperview];
                }
            }];
        }
    }];
    
}
+(instancetype)appView{
    NSBundle *bundle=[NSBundle mainBundle];
    return  [[bundle loadNibNamed:@"app" owner:nil options:nil] firstObject];
}

@end
