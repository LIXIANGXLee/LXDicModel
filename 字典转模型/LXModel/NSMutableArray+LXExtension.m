//
//  NSMutableArray+LXExtension.m
//  字典转模型
//
//  Created by 恒悦科技 on 2018/9/7.
//  Copyright © 2018年 李响. All rights reserved.
//

#import "NSMutableArray+LXExtension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (LXExtension)


+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(insertObject:atIndex:));
        Method lx_method = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(lx_insertObject:atIndex:));
        method_exchangeImplementations(method, lx_method);
    });
}

-(void)lx_insertObject:(id)anObject atIndex:(NSUInteger)index{

    if (!anObject)  return;
    [self lx_insertObject:anObject atIndex:index];
}


@end
