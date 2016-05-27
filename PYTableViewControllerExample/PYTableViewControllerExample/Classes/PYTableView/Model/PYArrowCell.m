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
    PYArrowCell *cell = [super init];
    // 默认选中状态
    cell.accessoryType = UITableViewCellSelectionStyleDefault;
    return cell;
}

@end
