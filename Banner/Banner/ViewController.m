//
//  ViewController.m
//  Banner
//
//  Created by tao xiong on 17/7/13.
//  Copyright © 2017年 tao xiong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *page_control;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview_banner;
@property(assign,nonatomic)int currentPage;

@property(strong,nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScrollViewData];
    [self initTimer];
}


-(void)initScrollViewData{
    CGFloat margin=0;
    CGFloat mWidth=200;
    CGFloat mHeight=145;
    CGFloat mTotalSize=5;
    self.currentPage=0;
    for (int i=0;i<mTotalSize; i++) {
        UIImageView *imageview=[[UIImageView alloc]init];
        NSString *str=[NSString stringWithFormat:@"banner_%02d",i];
        imageview.image=[UIImage imageNamed:str];
        imageview.frame=CGRectMake((mWidth+margin)*i, 0,mWidth, mHeight);
        [self.scrollview_banner addSubview:imageview];
    }
    
    self.scrollview_banner.contentSize=CGSizeMake((margin+mWidth)*5, 0);
    self.scrollview_banner.showsHorizontalScrollIndicator=NO;
    self.page_control.numberOfPages=mTotalSize;
    self.scrollview_banner.delegate=self;
    self.page_control.currentPage=self.currentPage;
    self.scrollview_banner.pagingEnabled=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",self.scrollview_banner.contentOffset.x);
    CGFloat offsetX=self.scrollview_banner.contentOffset.x;
    self.currentPage=(offsetX+100)/200;
    self.page_control.currentPage=self.currentPage;
}

-(void)nextImage{
    
    NSInteger page=self.page_control.currentPage;
    if (page>=self.page_control.numberOfPages-1) {
        page=0;
    }
    else{
        page++;
    }
    CGFloat offset=page*self.scrollview_banner.frame.size.width;
    //设置uiScrollview的偏移量
    [self.scrollview_banner setContentOffset:CGPointMake(offset, 0) animated:YES];
}

-(void)initTimer{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:true];
    
    //nstimer 网络默认的线程的优先级就低，
    
    //获取当前的消息循环对象
    NSRunLoop *runloop=[NSRunLoop currentRunLoop];
    
    //将当前的nstimer添加到消息循环对象中,提高nstimer的线程优先级
    [runloop addTimer:self.timer forMode:NSRunLoopCommonModes];
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //在拖拽之前清空计时器
    [self.timer invalidate];
    self.timer=nil;

}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];

}

@end
