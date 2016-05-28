//
//  SettingLabelCell.m
//  42-彩票
//
//  Created by 谢培艺 on 15/9/20.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYLabelCell.h"
@interface PYLabelCell()



@end

@implementation PYLabelCell

- (instancetype)init
{
    if (self = [super init]) {
        // 默认辅助样式
        self.accessoryType = UITableViewCellAccessoryNone;
        // 设置默认选中状态
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    return self;
}


// 重写accessoryView方法
- (UIView *)accessoryView
{
    [self.tableViewCell.labelView removeFromSuperview];
    if (self.label) { // 有自定义label
        [self.tableViewCell.contentView addSubview:self.label];
    } else {
        UILabel *label = [[UILabel alloc] init];
        label.text = self.text;
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = self.tableViewCell.bounds;
        self.tableViewCell.labelView = label;
        [self.tableViewCell.contentView addSubview:label];
    }
    return [super accessoryView];
}

+ (instancetype)cellWithText:(NSString *)text
{
    PYLabelCell *cell = [[self alloc] init];
    cell.text = text;
    return cell;
}

+ (instancetype)cellWithText:(NSString *)text didSelectedCell:(PYTableViewCellBlock)option
{
    PYLabelCell *cell = [self cellWithText:text];
    cell.option = option;
    return cell;
}

+ (instancetype)cellWithLabel:(UILabel *)label
{
    PYLabelCell *cell = [[self alloc] init];
    cell.label = label;
    return cell;
}

+ (instancetype)cellWithLabel:(UILabel *)label didSelectedCell:(PYTableViewCellBlock)option
{
    PYLabelCell *cell = [self cellWithLabel:label];
    cell.option = option;
    return cell;
}


@end
