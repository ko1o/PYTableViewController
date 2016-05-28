//
//  SettingSwitchCell.h
//  PYTableViewControllerExample
//
//  Created by 谢培艺 on 15/9/19.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYCell.h"
@class PYTableViewCell;
typedef void(^PYSwitchCellBlock)(UISwitch *switchButton, PYTableViewCell *tableViewCell, UITableView *tableView);

@interface PYSwitchCell : PYCell
/** 开关按钮 */
@property (nonatomic, strong) UISwitch *switchButton;

/** 点击switcButton所作的操作 */
@property (nonatomic, copy) PYSwitchCellBlock opeation;

+ (instancetype)cellWithTitle:(NSString *)title didClickSwitchButton:(PYSwitchCellBlock) option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon didClickSwitchButton:(PYSwitchCellBlock) option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didClickSwitchButton:(PYSwitchCellBlock) option;

@end
