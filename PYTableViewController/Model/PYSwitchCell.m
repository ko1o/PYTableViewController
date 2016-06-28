//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
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
