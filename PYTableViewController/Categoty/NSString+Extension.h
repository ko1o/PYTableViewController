//
//  NSString+Extension.h
//  新浪微博
//
//  Created by 谢培艺 on 15/12/15.
//  Copyright © 2015年 iphone5solo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/** 计算给定文本的大小*/
- (CGSize)sizeWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font;

/**
 * 秒 --> 具体时间
 */
+ (NSString *)intervalToDateWithIntervalString:(NSString *)intervalString;

/**
 * 具体时间 --> 秒
 */
+ (NSString *)dateToIntervalWithDate:(NSDate *)date;


/**
 * 用于首页时间显示（刚刚、几分钟前、昨天...）
 */
- (NSString *)dateToNow;

@end
