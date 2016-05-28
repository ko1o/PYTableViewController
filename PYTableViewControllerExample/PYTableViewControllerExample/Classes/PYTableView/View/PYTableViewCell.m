//
//  PYTableViewCell.m
//  youzhu
//
//  Created by 谢培艺 on 16/3/4.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYTableViewCell.h"
#import "PYCell.h"
#import "PYArrowCell.h"
#import "PYSwitchCell.h"
#import "PYDetailCell.h"
#import "PYLabelCell.h"

@interface PYTableViewCell ()



@end

@implementation PYTableViewCell

#pragma mark - 懒加载

// 重用cell的ID
static NSString *ID = @"cell";

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

#pragma mark - setting
- (void)setItem:(PYCell *)item
{
    _item = item;
  
    // 设置Cell的数据
    self.backgroundColor = item.backgroundColor ? item.backgroundColor : [UIColor whiteColor];
    self.textLabel.text = item.title;
    self.textLabel.font = item.titleFont ? item.titleFont : self.textLabel.font;
    self.textLabel.textColor = item.titleColor ? item.titleColor : [UIColor blackColor];
    self.detailTextLabel.text = item.accessoryTitle;
    self.detailTextLabel.font = item.accessoryTitleFont ? item.accessoryTitleFont : [UIFont systemFontOfSize:14];
    self.detailTextLabel.textColor = item.accessoryTitleColor ? item.accessoryTitleColor : [UIColor grayColor];
    self.imageView.image = item.icon.length ? [UIImage imageNamed:item.icon] : nil;
    self.selectionStyle = item.selectionStyle;
    self.accessoryType = item.accessoryType;
    self.accessoryView = item.accessoryView;
    self.backgroundView = item.backgroundImage ? [[UIImageView alloc] initWithImage:[UIImage imageNamed:item.backgroundImage]] : nil;
    
    // 是否隐藏自定义accessorView
    self.arrowAccessoryView.hidden = ![[item class] isSubclassOfClass:[PYArrowCell class]];
    self.detailAccessoryView.hidden = ![[item class] isSubclassOfClass:[PYDetailCell class]];
    self.labelView.hidden = ![[item class] isSubclassOfClass:[PYLabelCell class]];

}



@end
