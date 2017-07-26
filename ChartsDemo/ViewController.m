//
//  ViewController.m
//  ChartsDemo
//
//  Created by 尧的mac on 2017/7/12.
//  Copyright © 2017年 com.ylz.demo. All rights reserved.
//

#import "ViewController.h"

#import "ChartsDemo-Bridging-Header.h"


#import "ChartsDemo-Swift.h"
#import "Masonry.h"
#import "ZhuViewController.h"
#import "bingViewController.h"
@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *xVals;
@property (nonatomic, strong) BarChartView * barChartView;
@property(nonatomic,strong)BarChartData *data;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];




}
- (IBAction)zhuViewbut:(UIButton *)sender {
    
    
    ZhuViewController * zhu = [[ZhuViewController alloc] init];
    
    [self.navigationController pushViewController:zhu animated:YES];
    
    
    
}


- (IBAction)bingBut:(UIButton *)sender {
    
    
    bingViewController * zhu = [[bingViewController alloc] init];
    
    [self.navigationController pushViewController:zhu animated:YES];
}






@end
