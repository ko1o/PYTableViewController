//
//  SettingArrowCell.m
//  PYTableViewControllerExample
//
//  Created by 谢培艺 on 15/9/19.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYArrowCell.h"

@implementation PYArrowCell

- (instancetype)init
{
    if (self = [super init]) {
        // 默认辅助状态
        self.accessoryType = self.hiddenArrow ? UITableViewCellAccessoryNone : UITableViewCellAccessoryDisclosureIndicator;
        // 设置默认选中状态
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    return self;
}

// 重写setAccessoryView:方法，包装accessoryView
- (UIView *)accessoryView
{
    UIView *accessoryView = [super accessoryView];
    accessoryView.y = (self.height - accessoryView.height) * 0.5;
    accessoryView.x = [UIScreen mainScreen].bounds.size.width - accessoryView.width - 34;
    // 用button包装view,这样view就不会随着cell选中时高亮了
    [self.tableViewCell.arrowAccessoryView removeFromSuperview]; // 先移除
    UIButton *accessoryButton = [[UIButton alloc] init];
    [accessoryButton addSubview:accessoryView];
    self.tableViewCell.arrowAccessoryView = accessoryButton;
    [self.tableViewCell.contentView addSubview:accessoryButton];
    
    return nil;
}

@end
