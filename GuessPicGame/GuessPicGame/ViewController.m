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

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_next_question:(UIButton *)sender {
}

- (IBAction)btn_help:(UIButton *)sender {
}

- (IBAction)btn_big_img:(UIButton *)sender {
}

- (IBAction)btn_tips:(UIButton *)sender {
}
@end
