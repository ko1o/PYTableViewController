//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "UITableViewController+Extension.h"
#import <objc/runtime.h>

/** TableView的所有组*/
static NSMutableArray *_groups;

@implementation Group

- (NSArray *)cells
{
    if (_cells == nil) {
        _cells = [NSArray array];
        
    }
    return _cells;
}
@end

@implementation UITableViewController (Extension)

- (NSMutableArray *)groups
{
    return objc_getAssociatedObject(self, &_groups);
}

- (void)setGroups:(NSMutableArray *)groups
{
    return objc_setAssociatedObject(self, &_groups, groups, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
