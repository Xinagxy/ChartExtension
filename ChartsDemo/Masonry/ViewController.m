//
//  ViewController.m
//  ChartsDemo
//
//  Created by 尧的mac on 2017/7/14.
//  Copyright © 2017年 com.ylz.demo. All rights reserved.
//

#import "ViewController.h"
#import "ZhuViewController.h"
#import "bingViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)zhuViewbut:(UIButton *)sender {
    
    
    ZhuViewController * zhu = [[ZhuViewController alloc] init];
    
    [self.navigationController pushViewController:zhu animated:YES];
    
    
    
}


- (IBAction)bingBut:(UIButton *)sender {
    
    
    bingViewController * zhu = [[bingViewController alloc] init];
    
    [self.navigationController pushViewController:zhu animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
