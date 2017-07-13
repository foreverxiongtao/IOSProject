//
//  ViewController.m
//  电台项目
//
//  Created by tao xiong on 17/7/10.
//  Copyright © 2017年 tao xiong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *title_bar_container;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIImageView *iv_new_play_show;
@property (weak, nonatomic) IBOutlet UIView *buttom_container_tab;
@property(strong,nonatomic) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initTitleBar];
    [self fillScrollViewData];
    [self initScrollView];
}

-(void)initTitleBar{
    
    /***title ***/
    UILabel *title=[[UILabel alloc]init];
    title.frame=CGRectMake(137.5, 0, 100, 38);
    [title setText:@"音乐电台"];
    [self.title_bar_container addSubview:title];
    
    /***setting****/
    UIButton *setting=[[UIButton alloc]init];
    [setting setBackgroundImage:[UIImage imageNamed:@"find_setting_n.png" ]forState:UIControlStateNormal];
    [setting setBackgroundImage:[UIImage imageNamed:@"find_setting_h.png"]forState:UIControlStateHighlighted];
    setting.frame=CGRectMake(325, 7.5, 23, 23);
    [self.title_bar_container addSubview:setting];
    
    [self.view bringSubviewToFront:self.title_bar_container];
    
}

#pragma mark --填充数据到scrollview--
-(void)fillScrollViewData{
    
    self.imageView=[[UIImageView alloc]init];
    [self.imageView setImage:[UIImage imageNamed:@"finditem_iwannabehere.png"]];
    CGFloat x=CGRectGetMinX(self.iv_new_play_show.frame);
    CGFloat Y=CGRectGetMaxY(self.iv_new_play_show.frame);
    self.imageView.frame=CGRectMake(x, Y+50, 300, 75);
    
    [self.scrollview addSubview:self.imageView];
    self.scrollview.contentInset=UIEdgeInsetsMake(50, 0, 50, 0);
}

#pragma mark --初始化scrollview--

-(void)initScrollView{
    CGFloat height=CGRectGetMaxY(self.imageView.frame);
    self.scrollview.contentSize=CGSizeMake(0,height);
    self.scrollview.showsVerticalScrollIndicator=NO;
    [self.view bringSubviewToFront:self.buttom_container_tab];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
