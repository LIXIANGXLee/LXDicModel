//
//  ViewController.m
//  字典转模型
//
//  Created by 恒悦科技 on 2018/9/7.
//  Copyright © 2018年 李响. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+LXExtension.h"
#import "Person.h"
#import "Student.h"
#import "GoodStudent.h"

@interface ViewController ()

@property(nonatomic,strong)NSMutableArray * dataS;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    //字典
    NSArray * arr1 = @[@{@"id":@"1",@"name":@"小明"},@{@"id":@"2",@"name":@"小丽"},@{@"id":@"3",@"name":@"小黄"}];
    
     //字典与对象
    NSArray * arr2 = @[@{@"id":@"1",@"name":@"小明",@"student":@{@"id":@"1",@"name":@"张明"}},@{@"id":@"2",@"name":@"小丽",@"student":@{@"id":@"2",@"name":@"张丽"}},@{@"id":@"3",@"name":@"小黄",@"student":@{@"id":@"3",@"name":@"张黄"}}];
    
    
     //字典与对象与数组
     NSArray * arr3 = @[
        @{@"id":@"1",@"name":@"小明",@"student":@{@"id":@"1",@"name":@"张明"},@"boyMans":@[@{@"id":@"1",@"age":@"17"}]},
         @{@"id":@"2",@"name":@"小丽",@"student":@{@"id":@"2",@"name":@"张丽"},@"boyMans":@[@{@"id":@"2",@"age":@"18"}]},
         @{@"id":@"3",@"name":@"小黄",@"student":@{@"id":@"3",@"name":@"张黄"},@"boyMans":@[@{@"id":@"3",@"age":@"19"}]}];
    
    
    //字典与对象与数组里是数组
    NSArray * arr4 = @[
                       @{@"id":@"1",@"name":@"小明",@"student":@{@"id":@"1",@"name":@"张明"},@"boyMans":@[@{@"id":@"1",@"age":@"17",@"boyMans":@[@{@"id":@"1",@"age":@"22"}]}]},
                       @{@"id":@"2",@"name":@"小丽",@"student":@{@"id":@"2",@"name":@"张丽"},@"boyMans":@[@{@"id":@"2",@"age":@"18",@"boyMans":@[@{@"id":@"2",@"age":@"23"}]}]},
                       @{@"id":@"3",@"name":@"小黄",@"student":@{@"id":@"3",@"name":@"张黄"},@"boyMans":@[@{@"id":@"3",@"age":@"19",@"boyMans":@[@{@"id":@"3",@"age":@"24"}]}]}];
    
    
    
    NSArray * arr5 = @[@{@"id":@"1",@"name":@"小明",@"goodName":@"王者"},@{@"id":@"2",@"name":@"小丽",@"goodName":@"足球"},@{@"id":@"3",@"name":@"小黄",@"goodName":@"英雄"}];
    
    
    _dataS = [NSMutableArray arrayWithCapacity:3];
  
    NSMutableArray *_dataS1 = [NSMutableArray arrayWithCapacity:3];
  
    
            __weak typeof(self)weakSelf = self;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
      __strong typeof(weakSelf) strongSelf = weakSelf;
              for (NSDictionary * dic in arr4) {

            Person * a = [Person lx_objectWithDict:dic] ;
            GoodStudent * g = [GoodStudent lx_objectWithDict:dic];
                  
                  NSLog(@"===%@",g.name);
                  
            [strongSelf.dataS addObject:a];

                    }

            for (Person * p in strongSelf.dataS) {
                for (boyMan * m in p.boyMans) {
                    for (boyMan * b  in m.boyMans) {
                        NSLog(@"-------%@=%@",b.kid,b.age);
                    }
                }
            }

        });
    
          dispatch_async(dispatch_get_global_queue(0, 0), ^{
              for (NSDictionary * dic in arr4) {
                  Person * a1 = [Person lx_objectWithDict:dic];
                  [_dataS1 addObject:a1];

              }
              for (Person * p in _dataS1) {
                  for (boyMan * m in p.boyMans) {
                      for (boyMan * b  in m.boyMans) {
                          NSLog(@"=====%@===%@",b.kid,b.age);
                      }
                  }
              }

          });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
