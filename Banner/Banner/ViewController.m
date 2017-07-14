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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScrollViewData];
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

@end
