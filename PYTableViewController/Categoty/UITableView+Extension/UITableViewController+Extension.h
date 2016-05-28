//
//  UITableViewController+Extension.h
//  youzhu
//
//  Created by 谢培艺 on 16/1/20.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import <UIKit/UIKit.h>
// cell的组模型
@interface Group : NSObject
/** 组头标题*/
@property (nonatomic, copy) NSString *header;

/** 组尾标题*/
@property (nonatomic, copy) NSString *footer;

/** tableView的所有cell*/
@property (nonatomic, strong) NSArray *cells;

@end

@interface UITableViewController (Extension)


- (NSMutableArray *)groups;
- (void)setGroups:(NSMutableArray *)groups;

@end
