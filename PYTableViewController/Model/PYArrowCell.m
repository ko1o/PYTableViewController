//
//  SettingArrowCell.m
//  42-彩票
//
//  Created by 谢培艺 on 15/9/19.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYArrowCell.h"

@implementation PYArrowCell

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon class:(Class )ownClass
{
    PYArrowCell *cell = [super cellWithTitle:title icon:icon];
    
    cell.jumpToClass = ownClass;
    
    return cell;
}



@end
