//
//  SettingSwitchCell.m
//  42-彩票
//
//  Created by 谢培艺 on 15/9/19.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYSwitchCell.h"

@implementation PYSwitchCell

- (UISwitch *)switchButton
{
    if (!_switchButton) {
        _switchButton = [[UISwitch alloc] init];
    }
    return _switchButton;
}

@end
