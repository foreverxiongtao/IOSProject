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

@property (strong, nonatomic) IBOutlet UIView *answer_view;
@property (strong, nonatomic) IBOutlet UIView *option_view;

- (IBAction)btn_tips:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_next_question;

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
    self.lb_index.text=[NSString stringWithFormat:@"%d/%ld",self.currentIndex+1,self.questions.count];
    self.lb_title.text=question.title;
    [self.btn_content_img setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    [self generateDataForAnsWerView:question];
    [self generateDataForOptionView:question];
}

/***
 *生成答案框
 ***/
-(void)generateDataForAnsWerView:(DeQuestion *)question{
    if(question!=nil){
        /**让答案容器的每个子控件去执行某个方法**/
        [self.answer_view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        long length= [question.answer length];
        CGFloat margin=15;
        CGFloat width=30;
        CGFloat height=30;
        CGFloat left=(self.answer_view.frame.size.width-(length*width)-(length-1)*margin)*0.5;
        for (int i=0; i<length; i++) {
            UIButton *btn=[[UIButton alloc] init];
            CGFloat x=left+(margin+width)*i;
            [btn setBackgroundColor:[UIColor whiteColor]];
            btn.frame=CGRectMake(x, 0, width, height);
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.answer_view addSubview:btn];
            [btn addTarget:self action:@selector(setOnAnswerViewClickLisnter:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    }
}


/***
 **答案按钮点击事件
 */
-(void)setOnAnswerViewClickLisnter:(UIButton *)sender{
    NSInteger tag=sender.tag;
    [sender setTitle:@"" forState:UIControlStateNormal];
    for (UIButton *btn in self.option_view.subviews) {
        if(btn.tag==tag){
            btn.hidden=false;
            return;
        }
    }
    
}



/***
 *生成候选框
 ***/
-(void)generateDataForOptionView:(DeQuestion *)question{
    if (question!=nil) {
        int colCount=6;
        CGFloat margin=15;
        CGFloat width=30;
        CGFloat height=30;
        CGFloat orgin_x=(self.option_view.frame.size.width-(width*colCount)-(margin*(colCount-1)))*0.5;
        NSArray *options=question.options;
        [self.option_view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        for (int i=0; i<options.count; i++) {
            NSString *option=options[i];
            int rowIndex=i/colCount;
            int colIndex=i%colCount;
            int x=orgin_x+(width+margin)*colIndex;
            int y=(height+margin)*rowIndex;
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
            [button setTitle:option forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.option_view addSubview:button];
            [button addTarget:self action:@selector(setOptionClickListener:) forControlEvents:UIControlEventTouchUpInside];
            [button setTag:i];
        }
    }
}

-(void)switchAnswerView:(UIButton *)sender AndResult:(Boolean )isRight{
    if(isRight){
        [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    else{
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
}

-(UIButton *)findFirstEmptyAnswerView{
    for (UIButton *btn in self.answer_view.subviews) {
        if(btn.currentTitle.length==0){
            return btn;
        }
    }
    return nil;
}



-(void)check{
    Boolean isFull=true;
    NSMutableString *string=[NSMutableString string];
    for (UIButton *answer in self.answer_view.subviews) {
        if(answer.currentTitle.length==0){
            isFull=false;
        }
        else{
            [string appendString:answer.currentTitle];
        }
    }
    if(isFull){/***答案已满**/
        DeQuestion *question=self.questions[self.currentIndex];
        Boolean isRight=NO;
        if([string isEqualToString:question.answer]){
            isRight=YES;
        }
        int offset=-100;
        if(isRight){
            offset=100;
        }
        [self changeScore:offset];
        for (UIButton *btn in self.answer_view.subviews) {
            [self switchAnswerView:btn AndResult:isRight];
        }
        [self performSelector:@selector(nextQuestion) withObject:nil afterDelay:0.5];
    }
}



/***
 **修改分数
 */
-(void)changeScore:(int)offset{
    int currentScore=self.btn_score.currentTitle.intValue;
    currentScore+=offset;
    [self.btn_score setTitle:[NSString stringWithFormat:@"%d",currentScore] forState:UIControlStateNormal];
}




/***
 **给候选框设置点击事件
 **/
-(void)setOptionClickListener:(UIButton *)sender{
    UIButton *btn=[self findFirstEmptyAnswerView];
    if(btn==nil){
        return;
    }
    [btn setTitle:sender.currentTitle forState:UIControlStateNormal];
    [btn setTag:sender.tag];
    sender.hidden=YES;
    [self check];
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
    /**下一题时清空答案*/
    self.currentIndex++;
    if(self.currentIndex>=self.questions.count){
        if (self.btn_score.currentTitle.integerValue==2000) {
            UIAlertController *alertView=[UIAlertController alertControllerWithTitle:@"提示" message:@"恭喜通关" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *confirm=[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertView addAction:confirm];
            [self presentViewController:alertView animated:true completion:^{
                
            }];
            return;
        }
        UIAlertController *alertView=[UIAlertController alertControllerWithTitle:@"提示" message:@"最后一题" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *confirm=[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertView addAction:confirm];
        [self presentViewController:alertView animated:true completion:^{
            
        }];
        return;
    }
    if(self.currentIndex>=self.questions.count-1){
        self.btn_next_question.enabled=NO;
    }
    for (UIButton *btn in self.answer_view.subviews) {
        [btn setTitle:@"" forState:UIControlStateNormal];
    }
    [self fillDataToControl:self.questions[self.currentIndex]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_next_question:(UIButton *)sender {
    [self changeScore:-100];
    [self nextQuestion];
}

- (IBAction)btn_help:(UIButton *)sender {
 
}

- (IBAction)btn_big_img:(UIButton *)sender {
    [self createBigImg];
}

- (IBAction)btn_tips:(UIButton *)sender {
    DeQuestion *question=self.questions[self.currentIndex];
    NSString *first=[question.answer substringToIndex:1];
    for (UIButton *option in self.option_view.subviews) {
        if ([option.currentTitle isEqualToString:first]) {
            [self setOptionClickListener:option];
            [self changeScore:-100];
            return;
        }
    }
}
@end
