//
//  SettingSwitchCell.m
//  PYTableViewControllerExample
//
//  Created by 谢培艺 on 15/9/19.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYSwitchCell.h"
#import "PYTableViewCell.h"

@implementation PYSwitchCell

- (instancetype)init
{
    if (self = [super init]) {
        UISwitch *switchButton = [[UISwitch alloc] init];
        self.switchButton = switchButton;
        [self.switchButton  addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventValueChanged];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryView = self.switchButton;
    }
    return self;
}

- (void)didClicked:(UISwitch *)sender
{
    if (self.opeation) self.opeation(sender, self.tableViewCell, self.tableViewCell.tableView);
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon didClickSwitchButton:(PYSwitchCellBlock) option
{
    PYSwitchCell *cell = [self cellWithTitle:title icon:icon];
    cell.opeation = option;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title didClickSwitchButton:(PYSwitchCellBlock) option
{
    PYSwitchCell *cell = [self cellWithTitle:title];
    cell.opeation = option;
    return cell;
}



+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didClickSwitchButton:(PYSwitchCellBlock) option
{
    PYSwitchCell *cell = [self cellWithTitle:title icon:icon backgroundImage:backgroundImage];
    cell.opeation = option;
    return cell;
}

@end
