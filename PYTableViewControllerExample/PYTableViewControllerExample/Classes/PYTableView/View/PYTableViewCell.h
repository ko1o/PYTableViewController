//
//  PYTableViewCell.h
//  youzhu
//
//  Created by 谢培艺 on 16/3/4.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PYConst.h"


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

/** 带箭头的cell的自定义辅助view */
@property (nonatomic, weak) UIButton *arrowAccessoryView;

/** 带详情的cell的自定义辅助view */
@property (nonatomic, weak) UIButton *detailAccessoryView;

/** 带文本按钮的cell的label */
@property (nonatomic, weak) UILabel *labelView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView withTableViewCellStyle:(UITableViewCellStyle)style;


@end
