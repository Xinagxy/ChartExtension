//
//  PieChartViewController.m
//  ZFChartView
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PieChartViewController.h"
#import "ZFChart.h"

@interface PieChartViewController()<ZFPieChartDataSource, ZFPieChartDelegate>

@property (nonatomic, strong) ZFPieChart * pieChart;

@property (nonatomic, assign) CGFloat height;

@end

@implementation PieChartViewController

- (void)setUp{
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight){
        //首次进入控制器为横屏时
        _height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT * 0.5;
        
    }else{
        //首次进入控制器为竖屏时
        _height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT;
    }
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUp];
    
    self.pieChart = [[ZFPieChart alloc] initWithFrame:CGRectMake(0, 0, 240, _height)];
    self.pieChart.dataSource = self;
    self.pieChart.delegate = self;

//    self.pieChart.percentType = kPercentTypeInteger;
    self.pieChart.isShadow = NO;
//    self.pieChart.isAnimated = NO;
     self.pieChart.piePatternType = kPieChartPatternTypeForCircle;
    [self.pieChart strokePath];
    [self.view addSubview:self.pieChart];
}

#pragma mark - ZFPieChartDataSource
 //返回value数据(NSArray必须存储NSString类型)
- (NSArray *)valueArrayInPieChart:(ZFPieChart *)chart{
    return @[ @"20", @"20", @"30", @"30"];
}
  //返回颜色数组(NSArray必须存储UIColor类型)
- (NSArray *)colorArrayInPieChart:(ZFPieChart *)chart{
    return @[ZFColor(214, 205, 153, 1), ZFColor(78, 250, 188, 1), ZFColor(16, 140, 39, 1), ZFColor(45, 92, 34, 1)];
}

#pragma mark - ZFPieChartDelegate

- (void)pieChart:(ZFPieChart *)pieChart didSelectPathAtIndex:(NSInteger)index{
    NSLog(@"第%ld个",(long)index);
}

- (CGFloat)allowToShowMinLimitPercent:(ZFPieChart *)pieChart{
    return 5.f;
}
   //设置饼图的半径
- (CGFloat)radiusForPieChart:(ZFPieChart *)pieChart{
    return 120.f;
}

/** 此方法只对圆环类型(kPieChartPatternTypeForCirque)有效 */
- (CGFloat)radiusAverageNumberOfSegments:(ZFPieChart *)pieChart{
    return 2.f;
}

#pragma mark - 横竖屏适配(若需要同时横屏,竖屏适配，则添加以下代码，反之不需添加)

/**
 *  PS：size为控制器self.view的size，若图表不是直接添加self.view上，则修改以下的frame值
 */
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator{
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight){
        self.pieChart.frame = CGRectMake(0, 0, size.width, size.height - NAVIGATIONBAR_HEIGHT * 0.5);
    }else{
        self.pieChart.frame = CGRectMake(0, 0, size.width, size.height + NAVIGATIONBAR_HEIGHT * 0.5);
    }
    
    [self.pieChart strokePath];
}

@end
