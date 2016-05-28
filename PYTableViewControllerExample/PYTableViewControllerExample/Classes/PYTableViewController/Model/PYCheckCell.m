//
//  PYCheckCell.m
//  PYTableViewControllerExample
//
//  Created by 谢培艺 on 16/5/28.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYCheckCell.h"

@implementation PYCheckCell
- (instancetype)init
{
    if (self = [super init]) {
        // 默认辅助状态
        self.accessoryType = UITableViewCellAccessoryNone;
        // 设置默认选中状态
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        // 默认不选中
        self.checked = NO;
    }
    return self;
}

/** 重写accessoryView方法 **/
- (UIView *)accessoryView
{
    self.tableViewCell.accessoryType = self.isChecked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return nil;
}
@end
