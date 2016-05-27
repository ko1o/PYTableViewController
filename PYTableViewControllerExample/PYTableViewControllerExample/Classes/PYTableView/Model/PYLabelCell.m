//
//  SettingLabelCell.m
//  PYTableViewControllerExample
//
//  Created by 谢培艺 on 15/9/20.
//  Copyright (c) 2015年 谢培艺. All rights reserved.
//

#import "PYLabelCell.h"
@interface PYLabelCell()


@end

@implementation PYLabelCell

// 懒加载
- (void)setText:(NSString *)text
{
    _text = text;
}
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
}

+ (instancetype)cellWithTitle:(NSString *)title icon:(NSString *)icon
{
   
    return  [super cellWithTitle:title icon:icon];
}
@end
