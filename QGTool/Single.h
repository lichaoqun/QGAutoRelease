//
//  Single1.h
//  QGTool
//
//  Created by 李超群 on 2017/12/26.
//Copyright © 2017年 李超群. All rights reserved.

#pragma mark ************************************<#这个类的作用#>************************************

#import <Foundation/Foundation.h>
#import "NSObject+DYAutoRelease.h"

@interface Single1 : NSObject<DYAutoReleaseProtocol>

+(instancetype)shareInstance;

@end

@interface Single2 : NSObject<DYAutoReleaseProtocol>

+(instancetype)shareInstance;

@end
