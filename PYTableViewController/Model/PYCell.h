//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYTableViewCell.h"
#import "PYConst.h"
@class UITableViewCell;


typedef void(^PYTableViewCellBlock)(PYTableViewCell *selectedCell);

@interface PYCell : NSObject

/** 选中cell的回调, 当实现了回调对象和回调方法则忽略该回调 */
@property (nonatomic, copy) PYTableViewCellBlock option;

/** 回调对象 */
@property (weak, nonatomic) id target;
/** 回调方法 */
@property (assign, nonatomic) SEL action;

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

+ (instancetype)cellWithTitle:(NSString *)title didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon didSelectedCell:(PYTableViewCellBlock) option;
+ (instancetype)cellWithTitle:(NSString *)title accessoryView:(UIView *)accessoryView didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryView:(UIView *)accessoryView didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle didSelectedCell:(PYTableViewCellBlock)option;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didSelectedCell:(PYTableViewCellBlock)option;

+ (instancetype)cellWithTitle:(NSString *)title didSelectedCellTarget:(id)target action:(SEL)action;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon didSelectedCellTarget:(id)target action:(SEL)action;
+ (instancetype)cellWithTitle:(NSString *)title accessoryView:(UIView *)accessoryView didSelectedCellTarget:(id)target action:(SEL)action;
+ (instancetype)cellWithTitle:(NSString *)title accessoryTitle:(NSString *)accessoryTitle didSelectedCellTarget:(id)target action:(SEL)action;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryView:(UIView *)accessoryView didSelectedCellTarget:(id)target action:(SEL)action;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon accessoryTitle:(NSString *)accessoryTitle didSelectedCellTarget:(id)target action:(SEL)action;
+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon backgroundImage:(NSString *)backgroundImage didSelectedCellTarget:(id)target action:(SEL)action;

/** 设置回调对象和回调方法（此时，忽略option回调） */
- (void)didSelectedCellTarget:(id)target action:(SEL)action;

@end
