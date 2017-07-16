//
//  ViewController.m
//  UITableView的基本使用
//
//  Created by xiongtao on 17/7/16.
//  Copyright © 2017年 xiongtao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tv_list;
@property(strong,nonatomic) NSMutableArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.arr=[NSMutableArray array];
    for (int i=0; i<20; i++) {
        NSString *str=[NSString stringWithFormat:@"第%d行数据",i];
        [ self.arr addObject:str];
    }
    [self initTableView];
}


#pragma mark --设置uitableview的分组数，默认分组数是1--
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

#pragma mark --设置tableview总共的行数--
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.arr.count;

}


#pragma mark --设置单元格--
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=self.arr[indexPath.row];
    return cell;



}

#pragma mark --初始化tableview--
-(void)initTableView{
    //设置数据源
    self.tv_list.dataSource=self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
