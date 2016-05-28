//
//  UITableViewCell+Extension.h
//  youzhu
//
//  Created by 谢培艺 on 16/1/20.
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
