//
//  ViewController.m
//  GuessPicGame
//
//  Created by xiongtao on 17/6/25.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import "ViewController.h"
#import  "DeQuestion.h";

@interface ViewController ()
@property(nonatomic,strong) NSArray *questions;
@property (weak, nonatomic) IBOutlet UILabel *lb_index;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UIButton *btn_content_img;
@property (weak, nonatomic) IBOutlet UIButton *btn_score;
@property(nonatomic,assign) int currentIndex;
@property(nonatomic,assign) int totalScore;
@property(strong,nonatomic)UIButton *cover;
@property(assign,nonatomic)CGRect originFrame;
- (IBAction)btn_next_question:(UIButton *)sender;

- (IBAction)btn_help:(UIButton *)sender;

- (IBAction)btn_big_img:(UIButton *)sender;

- (IBAction)btn_tips:(UIButton *)sender;
@end

@implementation ViewController


-(NSArray *)questions{
    if(_questions==nil){
        NSString *path=[[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
        NSArray *questions=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *qts=[NSMutableArray array];
        for(NSDictionary *question in questions){
            DeQuestion *que=[DeQuestion questionWithDic:question];
            if (que!=nil) {
                [qts addObject:que];
            }
        }
        _questions=qts;
    }
    return  _questions;
}



-(UIButton *)cover{
    if(_cover==nil){
        _cover=[[UIButton alloc]initWithFrame:self.view.bounds];
        [_cover setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [_cover setAlpha:0];
        [_cover addTarget:self action:@selector(createBigImg) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_cover];
    }
    return  _cover;
}

/*
 *
 *设置状态栏的样式
 *
 */
-(UIStatusBarStyle)preferredStatusBarStyle{
    //    UIStatusBarStyleDefault                                     = 0,黑色黑色状态栏
    //    StatusBarStyleLightContent     NS_ENUM_AVAILABLE_IOS(7_0) = 1,亮色状态栏
    return UIStatusBarStyleLightContent;
}

/***
 *初始化书记
 ***/
-(void)initData{
    self.currentIndex=0;
    self.totalScore=1000;
    [self.btn_score setTitle:[NSString stringWithFormat:@"%d",self.totalScore] forState:UIControlStateNormal];
    [self fillDataToControl:self.questions[0]];
    self.originFrame=self.btn_content_img.frame;
    [self.btn_content_img addTarget:self action:@selector(createBigImg) forControlEvents:UIControlEventTouchUpInside];
}

/****
 *填充数据
 */
-(void)fillDataToControl:(DeQuestion *)question{
    self.lb_index.text=@"1/10";
    self.lb_index.text=[NSString stringWithFormat:@"%d/%ld",self.currentIndex+1,self.questions.count];
    self.lb_title.text=question.title;
    [self.btn_content_img setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    
}


/***
 * 创建点击大图功能
 *
 */
-(void) createBigImg{
    if(self.cover.alpha==0){/***显示***/
        CGFloat width=self.view.frame.size.width;
        CGFloat height=width;
        CGFloat y=(self.view.frame.size.height-width)*0.5;
        
        [UIView animateWithDuration:1 animations:^{
            self.cover.alpha=1;
            self.btn_content_img.frame=CGRectMake(0, y, width, height);
            [self.view bringSubviewToFront:self.btn_content_img];
        }];
    }
    else{
        [UIView animateWithDuration:1 animations:^{
            self.cover.alpha=0;
            self.btn_content_img.frame=self.originFrame;
        }];
    }
    
    
    
    
    //
    //
    //    UIImageView *cover=[[UIImageView alloc]init];
    //    cover setImage:[UIImage imageNamed:@""];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

/****
 **下一个问题
 */
-(void)nextQuestion{
    self.currentIndex++;
    if(self.currentIndex>=self.questions.count){
        return;
    }
    [self fillDataToControl:self.questions[self.currentIndex]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_next_question:(UIButton *)sender {
    [self nextQuestion];
}

- (IBAction)btn_help:(UIButton *)sender {
}

- (IBAction)btn_big_img:(UIButton *)sender {
    [self createBigImg];
}

- (IBAction)btn_tips:(UIButton *)sender {
}
@end
