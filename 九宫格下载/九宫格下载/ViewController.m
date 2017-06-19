//
//  ViewController.m
//  九宫格下载
//
//  Created by xiongtao on 17/6/18.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import "ViewController.h"
#import "DeApp.h"
#import "DeAppView.h"
@interface ViewController ()

@property(nonatomic,copy) NSArray *apps;
@end



@implementation ViewController

-(NSArray *)apps{
    if (_apps==nil) {
        NSString *path= [[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil];
        NSArray *arr= [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *target=[NSMutableArray array];
        for (int i=0; i<arr.count; i++) {
            NSDictionary  *dic=arr[i];
            DeApp *app= [DeApp appWithDic:dic];
            [target addObject:app];
            
        }
        _apps=target;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int mappWidth=75;
    int mAppHight=75;
    float mScreenWidht=self.view.frame.size.width;
    int mColumneCount=3;
    long mTotalCount=self.apps.count;
    float rowGap=(mScreenWidht-mappWidth*mColumneCount)/(mColumneCount+1);
    for (int i=0; i<mTotalCount; i++) {
        
        DeApp *app=self.apps[i];
        DeAppView *container=[DeAppView appView];
        if(container){
            container.app=app;
        }
        
        container.backgroundColor=[UIColor lightGrayColor];
                int rowIndex=i%mColumneCount;
                int columnIndex=i/mColumneCount;
                CGRect frame= CGRectMake(rowGap+(mappWidth+rowGap)*rowIndex,rowGap+columnIndex*(mAppHight+rowGap), mappWidth, mAppHight);
                container.frame=frame;
        
        //        UIView *container=[[UIView alloc]init];
        //        container.backgroundColor=[UIColor lightGrayColor];
        //        int rowIndex=i%mColumneCount;
        //        int columnIndex=i/mColumneCount;
        //        CGRect frame= CGRectMake(rowGap+(mappWidth+rowGap)*rowIndex,rowGap+columnIndex*(mAppHight+rowGap), mappWidth, mAppHight);
        //        container.frame=frame;
        //        [self.view addSubview:container];
        //
        //        //图片
        //        UIImageView *imageView= [[UIImageView alloc]init];
        //        imageView.image=[UIImage imageNamed:app.img];
        //        float image_X=container.frame.origin.x;
        //        float image_y=container.frame.origin.y;
        //        float imageWidth=35;
        //        float imageHeight=35;
        //        //        imageView.backgroundColor=[UIColor blueColor];
        //        imageView.frame=CGRectMake(20,0,imageWidth,imageHeight);
        //        [container addSubview:imageView];
        //
        //        //描述
        //        UILabel *lab= [[UILabel alloc ]init];
        //        lab.text=app.desc;
        //        lab.frame=CGRectMake(0,imageView.frame.size.height+5,mappWidth,10);
        //        lab.font=[UIFont systemFontOfSize:11];
        //        lab.textAlignment=NSTextAlignmentCenter;
        //        lab.textColor=[UIColor whiteColor];
        //        [container addSubview:lab];
        //
        //        //下载
        //        UIButton *btn= [ UIButton  buttonWithType:UIButtonTypeCustom];
        //        [btn setTitle:@"下载" forState:UIControlStateNormal];
        //        [btn setTitle:@"已下载" forState:UIControlStateDisabled];
        //         btn.titleLabel.font=[UIFont systemFontOfSize:12];
        //        float btn_Width=40;
        //        btn.frame=CGRectMake(17.5,lab.frame.origin.y+10, 40, 30);
        //        [btn addTarget:self action:@selector(setDownloadListener:) forControlEvents:UIControlEventTouchUpInside];
        //        [container addSubview:btn];
        
        [self.view addSubview:container];
    }
    
}



-(void)setDownloadListener:(UIButton *)btn{
    btn.enabled=NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
