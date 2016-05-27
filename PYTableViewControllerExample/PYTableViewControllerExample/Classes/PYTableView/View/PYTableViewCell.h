//
//  PYTableViewCell.h
//  youzhu
//
//  Created by 谢培艺 on 16/3/4.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PYCell;

@protocol PYTableViewCellDelegate <UITableViewDelegate>


@end

@protocol PYTableViewCellDataSource <UITableViewDataSource>

@end

@interface PYTableViewCell : UITableViewCell

@property (nonatomic, weak) id<PYTableViewCellDelegate> delegate;
@property (nonatomic, weak) id<PYTableViewCellDataSource> dataSource;

/** cell的模型*/
@property (nonatomic, strong) PYCell *item;

/** 每一个cell绑定一个tableView */
@property (nonatomic, weak) UITableView *tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView withTableViewCellStyle:(UITableViewCellStyle)style;


@end
