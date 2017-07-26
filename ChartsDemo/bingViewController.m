//
//  bingViewController.m
//  ChartsDemo
//
//  Created by 尧的mac on 2017/7/14.
//  Copyright © 2017年 com.ylz.demo. All rights reserved.
//

#import "bingViewController.h"
#import "ChartsDemo-Bridging-Header.h"


#import "ChartsDemo-Swift.h"
#import "Masonry.h"

#define BgColor [UIColor colorWithRed:230/255.0f green:253/255.0f blue:253/255.0f alpha:1]
@interface bingViewController ()<ChartViewDelegate>

@property (nonatomic, strong) PieChartView *pieChartView;
@property (nonatomic, strong) PieChartData *data;



@end

@implementation bingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BgColor;
    

    //updateData btn
    UIButton *display_btn = [[UIButton alloc] init];
    [display_btn setTitle:@"更新UI" forState:UIControlStateNormal];
    [display_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    display_btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:display_btn];
    [display_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(240);
    }];
    [display_btn addTarget:self action:@selector(updateData) forControlEvents:UIControlEventTouchUpInside];
    
    //创建饼状图
    self.pieChartView = [[PieChartView alloc] init];
    self.pieChartView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pieChartView];
    [self.pieChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.mas_equalTo(self.view);
    }];
    
    
    //基本样式
    [self.pieChartView setExtraOffsetsWithLeft:30 top:30 right:30 bottom:0];//饼状图距离边缘的间隙
    self.pieChartView.usePercentValuesEnabled = YES;//是否根据所提供的数据, 将显示数据转换为百分比格式
    self.pieChartView.dragDecelerationEnabled = YES;//拖拽饼状图后是否有惯性效果
    self.pieChartView.drawSliceTextEnabled = NO;//是否显示区块文本
    //空心饼状图样式 如果不需要空心样式的饼状图, 可以将饼状图的drawHoleEnabled赋值为NO, 将中间的文本去掉即可, 代码如下:
    self.pieChartView.drawHoleEnabled = YES;//饼状图是否是空心
    self.pieChartView.holeRadiusPercent = 0.5;//空心半径占比
    self.pieChartView.holeColor = [UIColor clearColor];//空心颜色
    self.pieChartView.transparentCircleRadiusPercent = 0.52;//半透明空心半径占比
    self.pieChartView.transparentCircleColor = [UIColor colorWithRed:210/255.0 green:145/255.0 blue:165/255.0 alpha:0.3];//半透明空心的颜色
    
    //实心饼状图样式
    //    self.pieChartView.drawHoleEnabled = NO;
    
    //饼状图中间描述
    if (self.pieChartView.isDrawHoleEnabled == YES) {
        self.pieChartView.drawCenterTextEnabled = YES;//是否显示中间文字
        //普通文本
        //        self.pieChartView.centerText = @"饼状图";//中间文字
        //富文本
        NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"饼状图"];
        [centerText setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
                                    NSForegroundColorAttributeName: [UIColor orangeColor]}
                            range:NSMakeRange(0, centerText.length)];
        self.pieChartView.centerAttributedText = centerText;
    }else{
        
        // drawHoleEnabled 为no时 走这个方法
        
    }
    self.pieChartView.delegate = self;
    
    //饼状图描述
  
    self.pieChartView.descriptionFont = [UIFont systemFontOfSize:0];
    self.pieChartView.descriptionTextColor = [UIColor grayColor];
    self.pieChartView.descriptionText = @"";
    

    
    
    //饼状图图例
    self.pieChartView.legend.maxSizePercent = 1;//图例在饼状图中的大小占比, 这会影响图例的宽高
    self.pieChartView.legend.formToTextSpace = 5;//文本间隔
    self.pieChartView.legend.font = [UIFont systemFontOfSize:0];//字体大小
    self.pieChartView.legend.textColor = [UIColor grayColor];//字体颜色
    self.pieChartView.legend.position = ChartLegendPositionBelowChartCenter;//图例在饼状图中的位置
    self.pieChartView.legend.form = ChartLegendFormNone;//图示样式: 方形、线条、圆形
    self.pieChartView.legend.formSize = 0;//图示大小
    
    
    
    //为饼状图提供数据
    self.data = [self setData];
    self.pieChartView.data = self.data;
    //设置动画效果
    [self.pieChartView animateWithXAxisDuration:1.0f easingOption:ChartEasingOptionEaseOutExpo];
    
}

//刷新
- (void)updateData{
    //为饼状图提供数据
    self.data = [self setData];
    self.pieChartView.data = self.data;
    //设置动画效果
    [self.pieChartView animateWithXAxisDuration:1.0f easingOption:ChartEasingOptionEaseOutExpo];
}

- (PieChartData *)setData{
    
    
    int count = 5;//饼状图总共有几块组成
    
    //每个区块的数据
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++) {

        double val = 200+10*i;
        BarChartDataEntry *entry = [[BarChartDataEntry alloc] initWithX:i y:val];
        
        [yVals addObject:entry];
    }
    
    
    
  
    
    //dataSet
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:yVals label:@""];
    dataSet.drawValuesEnabled = YES;//是否绘制显示数据
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObject:[UIColor colorWithRed:51/255.f green:211/255.f blue:188/255.f alpha:1.f]];
    
    [colors addObject:[UIColor colorWithRed:0/255.f green:131/255.f blue:205/255.f alpha:1.f]];
    
    [colors addObject:[UIColor colorWithRed:247/255.f green:116/255.f blue:10/255.f alpha:1.f]];
    
    [colors addObject:[UIColor colorWithRed:255/255.f green:78/255.f blue:72/255.f alpha:1.f]];
    
    [colors addObject:[UIColor colorWithRed:128/255.f green:0/255.f blue:128/255.f alpha:1.f]];
    
    dataSet.colors = colors;//区块颜色
    
    
    
    dataSet.sliceSpace = 0;//相邻区块之间的间距
    dataSet.selectionShift = 8;//选中区块时, 放大的半径
    dataSet.xValuePosition = PieChartValuePositionInsideSlice;//名称位置
    
    //PieChartValuePositionInsideSlice 数据显示在饼图内部  PieChartValuePositionOutsideSlice外部
    //外部条件下有折线
    dataSet.yValuePosition = PieChartValuePositionInsideSlice;//数据位置
//    //数据与区块之间的用于指示的折线样式
//    dataSet.valueLinePart1OffsetPercentage = 0.85;//折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
//    dataSet.valueLinePart1Length = 0.5;//折线中第一段长度占比
//    dataSet.valueLinePart2Length = 0.4;//折线中第二段长度最大占比
//    dataSet.valueLineWidth = 1;//折线的粗细
//    dataSet.valueLineColor = [UIColor brownColor];//折线颜色
    

    

    //对数据样式进行操作
    PieChartData *data = [[PieChartData alloc]  initWithDataSet:dataSet];
    
    //如果前面已设置将数据转化为百分比形式，那么这么设置数据格式为百分数形式NSNumberFormatterPercentStyle
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterPercentStyle;
    formatter.maximumFractionDigits = 0;//小数位数
    formatter.multiplier = @1.f;
    
    ChartDefaultValueFormatter  *forma =
    [[ChartDefaultValueFormatter alloc] initWithFormatter:formatter]
    ;
    [data setValueFormatter:forma];//设置显示数据格式
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
    [data setValueTextColor:[UIColor brownColor]];
    [data setValueFont:[UIFont systemFontOfSize:10]];

    
    return data;
}

- (void)chartValueSelected:(ChartViewBase * _Nonnull)chartView entry:(ChartDataEntry * _Nonnull)entry highlight:(ChartHighlight * _Nonnull)highlight{


    NSLog(@"%f",highlight.y);
}


@end
