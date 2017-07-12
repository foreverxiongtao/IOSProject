//
//  ViewController.m
//  ScrollViewProject
//
//  Created by xiongtao on 17/7/2.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iv_content;
@property (weak, nonatomic) IBOutlet UIScrollView *sv_container;
- (IBAction)offset:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}


-(void)initData{
    [self.sv_container setBackgroundColor:[UIColor blueColor]];
    self.sv_container.contentSize=self.iv_content.frame.size;
    self.sv_container.showsHorizontalScrollIndicator=NO;
    self.sv_container.showsVerticalScrollIndicator=NO;
    self.sv_container.bounces=YES;
    self.sv_container.contentInset=UIEdgeInsetsMake(100, 50, 20, 200);
    [self.sv_container setMaximumZoomScale:2];
    [self.sv_container setMinimumZoomScale:0.5];
    self.sv_container.delegate=self;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return self.iv_content;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)offset:(UIButton *)sender {
    CGPoint point=self.sv_container.contentOffset;
    point.x+=10;
    point.y+=10;
    self.sv_container.contentOffset=point;
}
@end
