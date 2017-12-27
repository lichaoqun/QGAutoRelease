//
//  Single1.m
//  QGTool
//
//  Created by 李超群 on 2017/12/26.
//Copyright © 2017年 李超群. All rights reserved.

#pragma mark ************************************<#这个类的作用#>************************************

#import "Single.h"

@implementation Single1

static Single1 *single1_ = nil;
+(instancetype)shareInstance{
    if (!single1_) {
        single1_ = [[self alloc]init];
    }
    return single1_;
}

-(void)releaseInstance{
    single1_ = nil;
}

-(void)dealloc{
    NSLog(@"Single1 -- dealloc ....");
}

@end

@implementation Single2

static Single2 *single2_ = nil;
+(instancetype)shareInstance{
    if (!single2_) {
        single2_ = [[self alloc]init];
    }
    return single2_;
}

-(void)releaseInstance{
    single2_ = nil;
}


-(void)dealloc{
    NSLog(@"Single2 -- dealloc ....");
}
@end
