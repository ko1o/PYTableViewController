//
//  SettingLabelCell.h
//  42-彩票
//
//  Created by 谢培艺 on 15/9/20.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYCell.h"

@interface PYLabelCell : PYCell

/** 文本内容*/
@property (nonatomic, copy) NSString *text;

/** 可通过这个属性来自定义label */
@property (nonatomic, strong) UILabel *label;

+ (instancetype)cellWithText:(NSString *)text;
+ (instancetype)cellWithText:(NSString *)text didSelectedCell:(PYTableViewCellBlock)option;

+ (instancetype)cellWithLabel:(UILabel *)label;
+ (instancetype)cellWithLabel:(UILabel *)label didSelectedCell:(PYTableViewCellBlock)option;

@end
