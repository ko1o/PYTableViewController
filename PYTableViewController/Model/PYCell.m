//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYCell.h"

@interface PYCell ()


@end

@implementation PYCell

- (CGFloat)height
{
    // 默认高为44
    return _height ? _height : 44;
}

// 初始化
- (instancetype)init
{
    if (self = [super init]) {
        // 默认cell选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 默认cell的辅助样式
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

+ (instancetype)cellWithTitle:(NSString *)title
{
    PYCell *cell = [[self alloc] init];
    cell.title = title;
    return cell;
}


+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon
{
    PYCell *cell = [self cellWithTitle:title];
    cell.icon = icon;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle
{
    PYCell *cell = [self cellWithTitle:title];
    cell.accessoryTitle = accessoryTitle;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title accessoryView:(UIView *)accessoryView
{
    PYCell *cell = [self cellWithTitle:title];
    cell.accessoryView = accessoryView;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle
{
    PYCell *cell  =  [self cellWithTitle:title icon:icon];
    cell.accessoryTitle = accessoryTitle;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryView:(UIView *)accessoryView
{
    PYCell *cell  =  [self cellWithTitle:title icon:icon];
    cell.accessoryView = accessoryView;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title didSelectedCell:(PYTableViewCellBlock)option
{
    PYCell *cell  =  [self cellWithTitle:title];
    cell.option = option;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock)option
{
    PYCell *cell = [self cellWithTitle:title didSelectedCell:option];
    cell.accessoryTitle = accessoryTitle;
    return cell;
}


+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock)option
{
    
    PYCell *cell  =  [self cellWithTitle:title icon:icon didSelectedCell:option];
    cell.accessoryTitle = accessoryTitle;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon didSelectedCell:(PYTableViewCellBlock)option
{
    PYCell *cell = [self cellWithTitle:title icon:icon];
    cell.option = option;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title accessoryView:(UIView *)accessoryView didSelectedCell:(PYTableViewCellBlock) option
{
    PYCell *cell = [self cellWithTitle:title accessoryView:accessoryView];
    cell.option = option;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage
{
    PYCell *cell = [self cellWithTitle:title icon:icon];
    cell.backgroundImage = backgroundImage;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryView:(UIView *)accessoryView didSelectedCell:(PYTableViewCellBlock)option
{
    PYCell *cell = [self cellWithTitle:title icon:icon accessoryView:accessoryView];
    cell.option = option;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didSelectedCell:(PYTableViewCellBlock)option
{
    PYCell *cell = [self cellWithTitle:title icon:icon didSelectedCell:option];
    cell.backgroundImage = backgroundImage;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title didSelectedCellTarget:(id)target action:(SEL)action
{
    PYCell *cell = [self cellWithTitle:title];
    cell.target = target;
    cell.action = action;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon didSelectedCellTarget:(id)target action:(SEL)action
{
    PYCell *cell = [self cellWithTitle:title icon:icon];
    cell.target = target;
    cell.action = action;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title accessoryView:(UIView *)accessoryView didSelectedCellTarget:(id)target action:(SEL)action
{
    PYCell *cell = [self cellWithTitle:title accessoryView:accessoryView];
    cell.target = target;
    cell.action = action;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle didSelectedCellTarget:(id)target action:(SEL)action
{
    PYCell *cell = [self cellWithTitle:title accessoryTitle:accessoryTitle];
    cell.target = target;
    cell.action = action;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryView:(UIView *)accessoryView didSelectedCellTarget:(id)target action:(SEL)action
{
    PYCell *cell = [self cellWithTitle:title icon:icon accessoryView:accessoryView];
    cell.target = target;
    cell.action = action;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle didSelectedCellTarget:(id)target action:(SEL)action
{
    PYCell *cell = [self cellWithTitle:title icon:icon accessoryTitle:accessoryTitle];
    cell.target = target;
    cell.action = action;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didSelectedCellTarget:(id)target action:(SEL)action
{
    PYCell *cell = [self cellWithTitle:title icon:icon backgroundImage:backgroundImage];
    cell.target = target;
    cell.action = action;
    return cell;
}

- (void)didSelectedCellTarget:(id)target action:(SEL)action
{
    self.target = target;
    self.action = action;
}


@end
