//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYDetailCell.h"

@implementation PYDetailCell

- (instancetype)init
{
    if (self = [super init]) {
        // 默认辅助样式
        self.accessoryType = UITableViewCellAccessoryDetailButton;
        // 设置默认选中状态
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    return self;
}

/** 重写accessoryView方法，包装accessoryView **/
- (UIView *)accessoryView
{
    UIView *accessoryView = [super accessoryView];
    accessoryView.y = (self.height - accessoryView.height) * 0.5;
    accessoryView.x = [UIScreen mainScreen].bounds.size.width - accessoryView.width - 50;
    // 用button包装view,这样view就不会随着cell选中时高亮了
    [self.tableViewCell.detailAccessoryView removeFromSuperview]; // 先移除
    UIButton *accessoryButton = [[UIButton alloc] init];
    [accessoryButton addSubview:accessoryView];
    self.tableViewCell.detailAccessoryView = accessoryButton;
    [self.tableViewCell.contentView addSubview:accessoryButton];
    
    return nil;
}


@end
