//
//  PYDetailCell.m
//  PYTableViewControllerExample
//
//  Created by 谢培艺 on 16/5/26.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYDetailCell.h"

@implementation PYDetailCell

- (instancetype)init
{
    PYDetailCell *cell = [super init];
    // 默认选中状态
    cell.accessoryType = UITableViewCellSelectionStyleDefault;
    return cell;
}
@end
