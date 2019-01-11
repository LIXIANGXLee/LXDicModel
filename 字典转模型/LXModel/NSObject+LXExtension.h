//
//  NSObject+LXExtension.h
//  字典转模型
//
//  Created by 恒悦科技 on 2018/9/7.
//  Copyright © 2018年 李响. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LXModelDelegate <NSObject>
@optional

/*
     With the conversion in the three array @{@"arr":@"className"}
 */
+ (NSDictionary *)arrayContainModelClass;

/*
     With the conversion in the three property @{@"kid":@"id"}
 */
+ (NSDictionary *)arrayContainModelproperty;

@end

@interface NSObject (LXExtension)

/*
    Running mechanism operation mode is adopted to realize，  Dictionary transfer model,Better performance.  If  key =id . Then the method will automatically change the id to ID, it is recommended that you define the properties with ID
 */

+ (instancetype)lx_objectWithDict:(NSDictionary *)dict;


@end
