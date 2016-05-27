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
#import "PYLabelCell.h"
#import "PYDetailCell.h"

@interface PYTableViewCell ()

/** 带箭头的cell的自定义辅助view */
@property (nonatomic, weak) UIButton *arrowAccessoryView;

/** 带详情的cell的自定义辅助view */
@property (nonatomic, weak) UIButton *detailAccessoryView;



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
    
    if (item.backgroundImage) { // 有背景图
        self.backgroundView.hidden = NO;
        // 设置背景图片
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:item.backgroundImage]];
    }else{
        self.backgroundView = nil;
    }
    
    // 设置辅助样式、选中样式
    self.arrowAccessoryView.hidden = YES;
    self.detailAccessoryView.hidden = YES;
    
    if ([item isKindOfClass:[PYArrowCell class]]) { // 右边辅助为箭头
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = nil;
        self.arrowAccessoryView.hidden = NO;
        self.accessoryType = item.hiddenArrow ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
        item.accessoryView.y = (item.height - item.accessoryView.height) * 0.5;
        item.accessoryView.x = [UIScreen mainScreen].bounds.size.width - item.accessoryView.width - 34;
        // 用button包装view,这样view就不会随着cell选中时高亮了
        [self.arrowAccessoryView removeFromSuperview]; // 先移除
        UIButton *accessoryButton = [[UIButton alloc] init];
        [accessoryButton addSubview:item.accessoryView];
        self.arrowAccessoryView = accessoryButton;
        [self.contentView addSubview:accessoryButton];
    } else {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        if ([item isKindOfClass:[PYSwitchCell class]]) {// 右边辅助为开关按钮
            PYSwitchCell *switchItem = (PYSwitchCell *)item;
            self.accessoryView = switchItem.switchButton;
        } else if ([item isKindOfClass:[PYDetailCell class]]) { // 右边为详情按钮
            self.selectionStyle = UITableViewCellSelectionStyleDefault;
            self.detailAccessoryView.hidden = NO;
            self.accessoryType = UITableViewCellAccessoryDetailButton;
            self.accessoryView = nil;
            item.accessoryView.y = (item.height - item.accessoryView.height) * 0.5;
            item.accessoryView.x = [UIScreen mainScreen].bounds.size.width - item.accessoryView.width - 50;
            // 用button包装view,这样view就不会随着cell选中时高亮了
            [self.detailAccessoryView removeFromSuperview]; // 先移除
            UIButton *accessoryButton = [[UIButton alloc] init];
            [accessoryButton addSubview:item.accessoryView];
            self.detailAccessoryView = accessoryButton;
            [self.contentView addSubview:accessoryButton];
        
        } else if ([item isKindOfClass:[PYCell class]]) { // 默认cell(一定要放在最后判断，因为PYCell是基类)
            self.accessoryType = UITableViewCellAccessoryNone;
            self.accessoryView = item.accessoryView;
        }
    }
}



@end
