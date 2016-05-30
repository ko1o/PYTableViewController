//
//  PYCheckCell.h
//  PYTableViewControllerExample
//
//  Created by 谢培艺 on 16/5/28.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYCell.h"

@interface PYCheckCell : PYCell

/** 是否选中 */
@property (nonatomic, assign, getter=isChecked) BOOL checked;

@end
