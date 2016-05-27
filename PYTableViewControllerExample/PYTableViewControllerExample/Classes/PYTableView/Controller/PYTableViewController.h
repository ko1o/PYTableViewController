//
//  PYTableViewController.h
//  youzhu
//
//  Created by 谢培艺 on 16/3/4.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYTableViewCell.h"
#import "PYArrowCell.h"
#import "PYDetailCell.h"
#import "PYSwitchCell.h"
#import "PYCell.h"
#import "PYGroup.h"

@interface PYTableViewController : UITableViewController

/** tableView的所有组*/
@property (nonatomic, strong) NSMutableArray *groups;

/** 选中的cell*/
@property (nonatomic, strong) PYTableViewCell *selectedCell;

@end
