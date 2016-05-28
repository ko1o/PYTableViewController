//
//  SettingTableViewCell.h
//  PYTableViewControllerExample
//
//  Created by 谢培艺 on 15/9/18.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYTableViewCell.h"
#import "PYConst.h"
@class UITableViewCell;

typedef void(^PYTableViewCellBlock)(PYTableViewCell *selectedCell, UITableView *tableView);

@interface PYCell : NSObject

/** 选中cell所进行的操作 */
@property (nonatomic, copy) PYTableViewCellBlock option;

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 标题字体大小 */
@property (nonatomic, strong) UIFont *titleFont;
/** 标题颜色 */
@property (nonatomic, strong) UIColor *titleColor;
/** 头像地址 */
@property (nonatomic, copy) NSString *icon;
/** 头像 */
@property (nonatomic, strong) UIView *iconView;

/** 背景图片 */
@property (nonatomic, copy) NSString *backgroundImage;
/** 背景颜色 */
@property (nonatomic, strong) UIColor *backgroundColor;

/** 附加说明 */
@property (nonatomic, copy) NSString *accessoryTitle;
/** 附加说明字体颜色 */
@property (nonatomic, strong) UIColor *accessoryTitleColor;
/** 附加说明字体大小 */
@property (nonatomic, strong) UIFont *accessoryTitleFont;
/** 附加视图 */
@property (nonatomic, strong) UIView *accessoryView;

/** 是否隐藏指示标 */
@property (nonatomic, assign) BOOL hiddenArrow;
/** cell的高度 */
@property (nonatomic, assign) CGFloat height;
/** cell的AccessoryType类型 */
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;
/** cell的选中状态 */
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;
/** 每一个模型绑定的tableViewcell */
@property (nonatomic, weak) PYTableViewCell *tableViewCell;


+ (instancetype)cellWithTitle:(NSString *)title;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)cellWithTitle:(NSString *)title accessoryView:(UIView *)accessoryView;
+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryView:(UIView *)accessoryView;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage;

+ (instancetype)cellWithTitle:(NSString *)title didSelectedCell:(PYTableViewCellBlock) option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon didSelectedCell:(PYTableViewCellBlock) option;
+ (instancetype)cellWithTitle:(NSString *)title accessoryView:(UIView *)accessoryView didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryView:(UIView *)accessoryView didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didSelectedCell:(PYTableViewCellBlock)option;

@end
