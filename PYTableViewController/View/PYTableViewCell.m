//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYTableViewCell.h"
#import "PYCell.h"
#import "PYArrowCell.h"
#import "PYSwitchCell.h"
#import "PYDetailCell.h"
#import "PYLabelCell.h"
#import "PYCheckCell.h"

@interface PYTableViewCell ()

/** 用来包装separatorView */
@property (nonatomic, strong) UIView *separatorViewCopy;

@end

@implementation PYTableViewCell

#pragma mark - 懒加载


// 重用cell的ID
static NSString *ID = @"PYCell";

#pragma mark - 初始化
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    // 从缓存池查找Cell
    PYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PYTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.tableView = tableView;
        
    }
    return cell;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView withTableViewCellStyle:(UITableViewCellStyle)style
{
    // 从缓存池查找Cell
    PYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PYTableViewCell alloc] initWithStyle:style reuseIdentifier:ID];
        cell.tableView = tableView;
    }
    return cell;
}


// 设置分隔线样式
- (void)setPyseparatorStyle:(PYTableViewCellSeparatorStyle)pyseparatorStyle
{
    _pyseparatorStyle = pyseparatorStyle;
    
    if (self.pyseparatorStyle == PYTableViewCellSeparatorStyleDefault) return;
    
    [self.separatorViewCopy removeFromSuperview]; // 先移除
    
    UIView *separatorView = [self.separatorView copy];

    self.separatorViewCopy = separatorView;
    if (self.pyseparatorStyle == PYTableViewCellSeparatorStyleCustomView) { // 自定义分隔线
        [self addSubview:self.separatorViewCopy];
        return;
    }
    separatorView.height = 0.5;
    separatorView.width = self.width;
    separatorView.y = self.height - separatorView.height;
    separatorView.backgroundColor = PYTableViewCellSeparatorColor;
    if (self.pyseparatorStyle == PYTableViewCellSeparatorStyleLongSingleLine) {
        separatorView.x = 0;
        [self addSubview:separatorView];
    } else if (self.pyseparatorStyle == PYTableViewCellSeparatorStyleMarginSingleLine) {
        separatorView.x = PYTableViewCellSeparatorMarginLeft;
        [self addSubview:separatorView];
    }
}

// 设置自定义分隔线
- (void)setSeparatorView:(UIView *)separatorView
{
    _separatorView = separatorView;
    
    // 如果没有自定义就返回
    if (!separatorView) return;
    
    // 取消系统自带的分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置样式为自定义
    [self setPyseparatorStyle:PYTableViewCellSeparatorStyleCustomView];
}


- (NSIndexPath *)indexPath
{
    return [self.tableView indexPathForCell:self];
}

#pragma mark - setting
- (void)setItem:(PYCell *)item
{
    _item = item;
    
    // 设置Cell的数据
    self.backgroundColor = item.backgroundColor ? item.backgroundColor : [UIColor whiteColor];
    self.textLabel.text = item.title;
    self.textLabel.font = item.titleFont ? item.titleFont : [UIFont systemFontOfSize:18];
    self.textLabel.textColor = item.titleColor ? item.titleColor : [UIColor blackColor];
    self.detailTextLabel.text = item.accessoryTitle;
    self.detailTextLabel.font = item.accessoryTitleFont ? item.accessoryTitleFont : [UIFont systemFontOfSize:14];
    self.detailTextLabel.textColor = item.accessoryTitleColor ? item.accessoryTitleColor : [UIColor grayColor];
    self.imageView.image = item.icon.length ? [UIImage imageNamed:item.icon] : nil;
    self.selectionStyle = item.selectionStyle;
    self.accessoryType = item.accessoryType;
    self.accessoryView = item.accessoryView;
    self.backgroundView = item.backgroundImage ? [[UIImageView alloc] initWithImage:[UIImage imageNamed:item.backgroundImage]] : nil;
    

    self.arrowAccessoryView.hidden = ![item isKindOfClass:[PYArrowCell class]];
    self.detailAccessoryView.hidden = ![item isKindOfClass:[PYDetailCell class]];
    self.labelView.hidden = ![item isKindOfClass:[PYLabelCell class]];
}

@end
