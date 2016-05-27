//
//  SettingTableViewCell.m
//  42-彩票
//
//  Created by 谢培艺 on 15/9/18.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYCell.h"

@implementation PYCell

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon
{
    PYCell *cell = [[self alloc] init];
    cell.title = title;
    cell.icon = icon;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock)option
{
    PYCell *cell  =  [self cellWithTitle:title icon:nil];
    cell.option = option;
    cell.accessoryTitle = accessoryTitle;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle
{
    
    PYCell *cell  =  [self cellWithTitle:title icon:icon];
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

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage
{
    PYCell *cell = [self cellWithTitle:title icon:icon];
    cell.backgroundImage = backgroundImage;
    return cell;
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didSelectedCell:(PYTableViewCellBlock)option
{
    PYCell *cell = [self cellWithTitle:title icon:icon didSelectedCell:option];
    cell.backgroundImage = backgroundImage;
    return cell;
}

@end
