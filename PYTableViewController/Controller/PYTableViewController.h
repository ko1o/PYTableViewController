//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PYTableViewCell.h"
#import "PYArrowCell.h"
#import "PYDetailCell.h"
#import "PYSwitchCell.h"
#import "PYCell.h"
#import "PYGroup.h"
#import "PYLabelCell.h"
#import "PYConst.h"
#import "PYCheckCell.h"

@interface PYTableViewController : UITableViewController

/** tableView的所有组,包含着是PYGroup模型 */
@property (nonatomic, strong) NSMutableArray *groups;

/** 选中的cell */
@property (nonatomic, strong) PYTableViewCell *selectedCell;
/** 设置分隔线样式 */
@property (nonatomic, assign) PYTableViewCellSeparatorStyle separatorStyle;
/** 设置自定义分割线（当设置了自定义，忽略separatorStyle属性） */
@property (nonatomic, strong) UIView *separatorView;

@end
