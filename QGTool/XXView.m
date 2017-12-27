//
//  XXView.m
//  TimerDealloc
//
//  Created by 李超群 on 2017/12/25.
//Copyright © 2017年 李超群. All rights reserved.

#pragma mark ************************************<#这个类的作用#>************************************

#import "XXView.h"
#import "NSTimer+DYAutoRelease.h"

@interface XXView ()

#pragma mark - 私有属性

@end

@implementation XXView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        self.autoReleaseObj = [Single1 shareInstance];
        self.autoReleaseObj = [Single2 shareInstance];
        self.autoReleaseObj = [Single1 shareInstance];
        
        [NSTimer dy_scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimerDo) userInfo:nil repeats:YES];
        [[NSNotificationCenter defaultCenter]dy_addObserver:self selector:@selector(testxx1) name:@"testxx1" object:nil];
        [[NSNotificationCenter defaultCenter]dy_addObserver:self selector:@selector(testxx2) name:@"testxx2" object:nil];
        [[NSNotificationCenter defaultCenter]dy_addObserver:self selector:@selector(testxx1) name:@"testxx1" object:nil];
        
    }
    return self;
}

-(void)onTimerDo{
    
    CGRect rect = self.frame;
    rect.origin.y += 10;
    self.frame = rect;
}



-(void)testxx1{
    NSLog(@"testxx1");
}


-(void)testxx2{
    NSLog(@"testxx2");
}
-(void)dealloc{
    NSLog(@"XXView dealloc");
}

@end
