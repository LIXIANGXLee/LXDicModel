//
//  Person.h
//  字典转模型
//
//  Created by 恒悦科技 on 2018/9/7.
//  Copyright © 2018年 李响. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "boyMan.h"

@interface Person : NSObject
@property(nonatomic,copy)NSString * kid;
@property(nonatomic,copy)NSString * name;
@property(nonatomic,strong)Student * student;
@property(nonatomic,strong)NSArray * boyMans;

@end
