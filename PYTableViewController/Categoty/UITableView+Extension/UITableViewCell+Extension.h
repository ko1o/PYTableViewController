//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^UITableViewCellBlock)();

@interface UITableViewCell (Extension)

/** 选中cell的操作 */
- (UITableViewCellBlock)operation;
- (void)setOperation:(UITableViewCellBlock)operation;

+ (instancetype)cellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier didSelectedCell:(void(^)(UITableViewCell *selectedcell))didSelectedCell;


@end
