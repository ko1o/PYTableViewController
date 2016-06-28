//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
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
