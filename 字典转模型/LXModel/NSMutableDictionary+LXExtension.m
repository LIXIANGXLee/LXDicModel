//
//  NSMutableDictionary+LXExtension.m
//  字典转模型
//
//  Created by 恒悦科技 on 2018/9/10.
//  Copyright © 2018年 李响. All rights reserved.
//

#import "NSMutableDictionary+LXExtension.h"
#import <objc/runtime.h>



@implementation NSMutableDictionary (LXExtension)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKeyedSubscript:));
        Method lx_method = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(lx_setObject:forKeyedSubscript:));
        method_exchangeImplementations(method, lx_method);
        
    });
}

-(void)lx_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key{
    
    if (!obj || !key) return;
    [self lx_setObject:obj forKeyedSubscript:key];
}

@end
