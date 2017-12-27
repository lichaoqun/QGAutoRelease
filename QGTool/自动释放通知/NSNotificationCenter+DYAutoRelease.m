//
//  NSNotificationCenter+DYAutoRelease.m
//  QGTool
//
//  Created by 李超群 on 2017/12/27.
//  Copyright © 2017年 李超群. All rights reserved.
//

#import "NSNotificationCenter+DYAutoRelease.h"
#import <objc/message.h>

@implementation DYNotiAutoReleaseHelp

/** 释放关联的对象 */
-(void)dealloc{
    NSLog(@"[DYNotiAutoReleaseHelp]  dealloc ____ 移除了通知......");
   [[NSNotificationCenter defaultCenter] removeObserver:self.obj];
}

@end

@implementation NSObject (DYNotiAutoRelease)
@dynamic notiAutoReleaseDic;

-(void)setNotiAutoReleaseDic:(NSDictionary *)notiAutoReleaseDic{
    NSString *key = [notiAutoReleaseDic valueForKey:@"name"];
    if (!objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key))) {
        DYNotiAutoReleaseHelp *helper = [DYNotiAutoReleaseHelp new];
        helper.obj = [notiAutoReleaseDic valueForKey:@"observer"];
        objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), helper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
@end

@implementation NSNotificationCenter (DYAutoRelease)

- (void)dy_addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject{
    NSObject *obj = (NSObject *)observer;
    if (!objc_getAssociatedObject(observer, (__bridge const void * _Nonnull)(aName))) {
    obj.notiAutoReleaseDic = @{@"name" : aName, @"observer" : observer};
    [[NSNotificationCenter defaultCenter]addObserver:observer selector:aSelector name:aName object:anObject];
    }
}

@end
