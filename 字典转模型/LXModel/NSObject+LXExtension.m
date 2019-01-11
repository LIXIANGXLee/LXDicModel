//
//  NSObject+LXExtension.m
//  字典转模型
//
//  Created by 恒悦科技 on 2018/9/7.
//  Copyright © 2018年 李响. All rights reserved.
//

#import "NSObject+LXExtension.h"
#import <objc/runtime.h>
#import "LXExtensionConst.h"

@implementation NSObject (LXExtension)

#pragma mark - 外部方法- 字典转模型
+ (instancetype)lx_objectWithDict:(NSDictionary *)dict{
    
    // 创建对应模型对象
    id objc = [[self alloc] init];
    Class c = self;
    
    while (c && ![c isMemberOfClass:object_getClass([NSObject class])]) {
        [self lx_objc:objc class:c withDict:dict];
        c = class_getSuperclass(c);
    }
    
    return objc;
}

#pragma mark - 私有方法- 字典转模型实现
-(void)lx_objc:(id)objc class:(Class)c withDict:(NSDictionary *)dict{
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(c, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString * propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [propertyName substringFromIndex:1];
        
        //定义一个id类型的value
        id value ;
        if ([self respondsToSelector:@selector(arrayContainModelproperty)]) {
            value = [self lx_objWithDict:dict withKey:key];
        }
        
        // 判断值是否是对象并且是自定义的
        if ([value isKindOfClass:[NSDictionary class]]) {
            Class modalClass = [self lx_objcIvartype:ivar];
            if (modalClass) {
                value = [modalClass lx_objectWithDict:value];
            }
        }
        
        // 判断值是否是数组
        if ([value isKindOfClass:[NSArray class]]) {
            value = [self lx_objValue:value withKey:key];
        }
        if (value) {
            
            LXExtensionSemaphoreCreate
            LXExtensionSemaphoreWait
            [objc setValue:value forKey:key];
            LXExtensionSemaphoreSignal
        }
    }
    
    free(ivarList);
}

#pragma mark - 私有方法- 判断是否存在改变属性名字
-(id)lx_objWithDict:(NSDictionary *)dict withKey:(NSString *)key{
    
    id value;
    if ([[[(id)self arrayContainModelproperty] objectForKey:key] length]) {
        value  = dict[[[(id)self arrayContainModelproperty] objectForKey:key]];
    }else{
        value  = [dict objectForKey:key];
    }
    return value;
}

#pragma mark - 私有方法 - 去掉特殊符号 为了转成class类型
-(Class)lx_objcIvartype:(Ivar)ivar{
    
    NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
    if (![ivarType containsString:@"NS"]) {
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        return  NSClassFromString(ivarType);
    }
    
    return nil;
}

#pragma mark - 私有方法 - value为数组 处理方法
-(id)lx_objValue:(id)value withKey:(NSString *)key{
    
    if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
        id idSelf = self;
        NSString *type =  [idSelf arrayContainModelClass][key];
        Class classModel = NSClassFromString(type);
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in value) {
            id model =  [classModel lx_objectWithDict:dict];
            [arrM addObject:model];
        }
        return arrM;
    }
    
    return value;
}

@end
