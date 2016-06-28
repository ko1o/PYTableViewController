//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
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
