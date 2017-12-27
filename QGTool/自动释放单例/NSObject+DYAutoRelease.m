//
//  NSObject+DYAutoRelease.m
//  QGTool
//
//  Created by 李超群 on 2017/12/26.
//  Copyright © 2017年 李超群. All rights reserved.
//

#import "NSObject+DYAutoRelease.h"
#import <objc/message.h>

@implementation NSObject (DYAutoRelease)
@dynamic autoReleaseObj;

#pragma mark - 重写的方法
-(void)setAutoReleaseObj:(id<DYAutoReleaseProtocol>)autoReleaseObj{
    NSString *key = NSStringFromClass([autoReleaseObj class]);
    if (!objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key))) {
        DYAutoReleaseHelp *helper = [DYAutoReleaseHelp new];
        helper.obj = autoReleaseObj;
        objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
}
@end

@implementation DYAutoReleaseHelp

/** 释放关联的对象 */
-(void)dealloc{
    if (self.obj && [self.obj respondsToSelector:@selector(releaseInstance)]) {
        [self.obj releaseInstance];
        NSLog(@"[DYAutoReleaseHelp]  dealloc ____ 释放了单例 ......");

    }
}

@end
