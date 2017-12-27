//
//  NSTimer+DYAutoRelease.m
//  QGTool
//
//  Created by 李超群 on 2017/12/26.
//  Copyright © 2017年 李超群. All rights reserved.
//

#import "NSTimer+DYAutoRelease.h"

@implementation NSTimer (DYAutoRelease)

/** 计时器 */
+ (NSTimer *)dy_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    DYAutoReleaseTimer  * autoReleaseTimer = [[DYAutoReleaseTimer alloc] init];
    autoReleaseTimer.target = aTarget;
    autoReleaseTimer.selector = aSelector;
    autoReleaseTimer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:autoReleaseTimer selector:@selector(timerSelector:) userInfo:userInfo repeats:yesOrNo];
    return autoReleaseTimer.timer;
}

@end

@implementation DYAutoReleaseTimer


-(void)timerSelector:(NSTimer*)timer{
    if (self.target) {
        [self.target performSelector:self.selector withObject:timer.userInfo afterDelay:0];
    }else{
        [self.timer invalidate];
        self.timer = nil;
    }
}

-(void)dealloc{
    NSLog(@"[DYAutoReleaseTimer]  dealloc ____ 移除了计时器 ......");
}
@end
