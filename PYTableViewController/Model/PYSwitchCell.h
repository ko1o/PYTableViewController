//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
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
