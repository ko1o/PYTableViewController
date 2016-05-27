//
//  SettingArrowCell.h
//  42-彩票
//
//  Created by 谢培艺 on 15/9/19.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYCell.h"

@interface PYArrowCell : PYCell

/** 所要跳转的类*/
@property (nonatomic, assign) Class jumpToClass;

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon class:(Class )ownClass;


@end
