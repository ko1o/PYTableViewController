//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PYGroup : NSObject

/** 头部标题*/
@property (nonatomic, copy) NSString *header;

/** 尾部标题*/
@property (nonatomic, copy) NSString *footer;

/** 每一组所有的cells,每一组都是PYCell模型*/
@property (nonatomic, strong) NSMutableArray *cells;


#pragma mark - 快速创建组方法
+ (instancetype)group;
+ (instancetype)groupWithHeader:(NSString *)header;
+ (instancetype)groupWithFooter:(NSString *)footer;
+ (instancetype)groupWithcells:(NSMutableArray *)cells;
+ (instancetype)groupWithHeader:(NSString *)header footer:(NSString *)footer;
+ (instancetype)groupWithHeader:(NSString *)header cells:(NSMutableArray *)cells;
+ (instancetype)groupWithFooter:(NSString *)footer cells:(NSMutableArray *)cells;
+ (instancetype)groupWithHeader:(NSString *)header footer:(NSString *)footer cells:(NSMutableArray *)cells;

@end
