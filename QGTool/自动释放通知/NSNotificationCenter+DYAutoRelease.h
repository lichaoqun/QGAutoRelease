//
//  NSNotificationCenter+DYAutoRelease.h
//  QGTool
//
//  Created by 李超群 on 2017/12/27.
//  Copyright © 2017年 李超群. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYNotiAutoReleaseHelp : NSObject

#pragma mark - 公有属性
/** 关联的要释放的对象 */
@property (nonatomic, weak) NSObject * _Nullable obj;

#pragma mark - 公有方法

@end

@interface NSObject (DYNotiAutoRelease)

#pragma mark - 公有属性
/** 关联的要释放的对象 */
@property (nonatomic, strong)NSDictionary* _Nullable notiAutoReleaseDic;

@end

@interface NSNotificationCenter (DYAutoRelease)

- (void)dy_addObserver:(id _Nullable )observer selector:(SEL _Nullable )aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject;

@end
