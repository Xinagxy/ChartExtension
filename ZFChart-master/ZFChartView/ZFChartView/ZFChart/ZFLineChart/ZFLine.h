//
//  ZFLine.h
//  ZFChartView
//
//  Created by apple on 16/3/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

/**
 *  波浪图样式
 */
typedef enum{
    kLinePatternTypeForSharp = 0,   //直线样式(默认样式)
    kLinePatternTypeForCurve = 1    //曲线样式
}kLinePatternType;

@interface ZFLine : CAShapeLayer

/** 是否带阴影效果(默认为YES) */
@property (nonatomic, assign) BOOL isShadow;

#pragma mark - public method

/**
 *  线
 *
 *  @param valuePointArray 当前线段圆环的中心点数组
 *
 *  @return self
 */
+ (instancetype)lineWithValuePointArray:(NSMutableArray *)valuePointArray isAnimated:(BOOL)isAnimated shadowColor:(UIColor *)shadowColor linePatternType:(kLinePatternType)linePatternType padding:(CGFloat)padding;

@end
