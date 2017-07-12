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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initTitleBar];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
