//
//  LXExtensionConst.h
//  字典转模型
//
//  Created by 恒悦科技 on 2018/9/7.
//  Copyright © 2018年 李响. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXExtensionConst : NSObject


// 信号量
#define LXExtensionSemaphoreCreate \
static dispatch_semaphore_t signalSemaphore; \
static dispatch_once_t onceTokenSemaphore; \
dispatch_once(&onceTokenSemaphore, ^{ \
signalSemaphore = dispatch_semaphore_create(1); \
});

#define LXExtensionSemaphoreWait \
dispatch_semaphore_wait(signalSemaphore, DISPATCH_TIME_FOREVER);

#define LXExtensionSemaphoreSignal \
dispatch_semaphore_signal(signalSemaphore);


// 日志输出
#ifdef DEBUG
#define LXExtensionLog(...) NSLog(__VA_ARGS__)
#else
#define LXExtensionLog(...)
#endif

@end
