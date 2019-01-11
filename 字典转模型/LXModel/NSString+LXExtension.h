//
//  NSString+LXExtension.h
//  字典转模型
//
//  Created by 恒悦科技 on 2018/9/7.
//  Copyright © 2018年 李响. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LXExtension)
/**
 *  Hump to  underline（myinfo ->my_info）
 */
- (NSString *)lx_underlineFromCamel;


/**
 *  Underline to hump（my_info -> myinfo）
 */
- (NSString *)lx_camelFromUnderline;


/**
 * Capitalization of initials
 */
- (NSString *)lx_firstCharUpper;


/**
 * Initial letter lowercase
 */
- (NSString *)lx_firstCharLower;

@end
