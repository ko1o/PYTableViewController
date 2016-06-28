//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYGroup.h"

@implementation PYGroup

- (NSMutableArray *)cells
{
    if (!_cells) {
        _cells = [NSMutableArray array];
    }
    return _cells;
}


+ (instancetype)group
{
    return [[self alloc] init];
}

+ (instancetype)groupWithHeader:(NSString *)header
{
    PYGroup *group = [self group];
    group.header = header;
    return group;
}

+ (instancetype)groupWithFooter:(NSString *)footer
{
    PYGroup *group = [self group];
    group.footer = footer;
    return group;
}

+ (instancetype)groupWithcells:(NSMutableArray *)cells
{
    PYGroup *group = [self group];
    group.cells = cells;
    return group;
}

+ (instancetype)groupWithHeader:(NSString *)header footer:(NSString *)footer
{
    PYGroup *group = [self groupWithHeader:header];
    group.footer = footer;
    return group;
}

+ (instancetype)groupWithHeader:(NSString *)header cells:(NSMutableArray *)cells
{
    PYGroup *group = [self groupWithHeader:header];
    group.cells = cells;
    return group;
}

+ (instancetype)groupWithFooter:(NSString *)footer cells:(NSMutableArray *)cells
{
    PYGroup *group = [self groupWithFooter:footer];
    group.cells = cells;
    return group;
}

+ (instancetype)groupWithHeader:(NSString *)header footer:(NSString *)footer cells:(NSMutableArray *)cells
{
    PYGroup *group = [self groupWithHeader:header footer:footer];
    group.cells = cells;
    return group;
}

@end
