//
//  NSTimer+DYAutoRelease.h
//  QGTool
//
//  Created by 李超群 on 2017/12/26.
//  Copyright © 2017年 李超群. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (DYAutoRelease)

/** 计时器 */
+ (instancetype _Nonnull)dy_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget selector:(SEL _Nonnull )aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end

@interface DYAutoReleaseTimer : NSObject

/**  计时器 */
@property (nonatomic, strong) NSTimer * _Nullable timer;

/** 执行方法的对象 */
@property (nonatomic,weak) id _Nullable  target;

/** 执行的方法 */
@property (nonatomic,assign) SEL _Nonnull  selector;

-(void)timerSelector:(NSTimer *_Nonnull)timer;
@end;
