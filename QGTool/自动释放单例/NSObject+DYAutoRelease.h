//
//  NSObject+DYAutoRelease.h
//  QGTool
//
//  Created by 李超群 on 2017/12/26.
//  Copyright © 2017年 李超群. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+DYAutoRelease.h"

@protocol DYAutoReleaseProtocol <NSObject>

-(void)releaseInstance;

@end

@interface NSObject (DYAutoRelease)

#pragma mark - 公有属性
/** 关联的要释放的对象 */
@property (nonatomic, weak) id <DYAutoReleaseProtocol> autoReleaseObj;

@end

@interface DYAutoReleaseHelp : NSObject

#pragma mark - 公有属性
/** 关联的要释放的对象 */
@property (nonatomic, weak) id <DYAutoReleaseProtocol> obj;

#pragma mark - 公有方法

@end
