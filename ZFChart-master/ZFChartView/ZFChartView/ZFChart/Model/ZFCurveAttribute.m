//
//  ZFCurveAttribute.m
//  ZFChartView
//
//  Created by apple on 2016/11/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZFCurveAttribute.h"

@implementation ZFCurveAttribute

- (instancetype)init{
    self = [super init];
    if (self) {
        _pointArray = [NSMutableArray array];
    }
    return self;
}

@end
