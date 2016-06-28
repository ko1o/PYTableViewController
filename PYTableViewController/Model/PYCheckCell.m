//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
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
