//
//  SettingTableViewCell.h
//  42-彩票
//
//  Created by 谢培艺 on 15/9/18.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PYTableViewCell;
@class UITableViewCell;

typedef void(^PYTableViewCellBlock)(PYTableViewCell *selectedCell, UITableView *tableView);

@interface PYCell : NSObject

/** 选中cell所进行的操作*/
@property (nonatomic, copy) PYTableViewCellBlock option;

/** cell的标题*/
@property (nonatomic, copy) NSString *title;

/** cell的标题颜色*/
@property (nonatomic, strong) UIColor *titleColor;

/** cell的头像地址*/
@property (nonatomic, copy) NSString *icon;

/** cell的头像*/
@property (nonatomic, strong) UIView *iconView;

/** cell的副标题*/
@property (nonatomic, copy) NSString *subTitle;

/** 背景图片*/
@property (nonatomic, copy) NSString *backgroundImage;

/** 辅助说明*/
@property (nonatomic, copy) NSString *accessoryTitle;

/** 辅助说明字体颜色*/
@property (nonatomic, strong) UIColor *accessoryTitleColor;

/** 辅助说明字体大小*/
@property (nonatomic, strong) UIFont *accessoryTitleFont;

/** 辅助view*/
@property (nonatomic, strong) UIView *accessoryView;

/** 是否隐藏指示标*/
@property (nonatomic, assign) BOOL hiddenArrow;

/** */
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle;
+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock) option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock) option;


+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon didSelectedCell:(PYTableViewCellBlock) option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didSelectedCell:(PYTableViewCellBlock) option;

@end
