//
//  PYTableViewGroup.h
//  youzhu
//
//  Created by 谢培艺 on 16/3/4.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PYGroup : NSObject

/** 头部标题*/
@property (nonatomic, copy) NSString *header;

/** 尾部标题*/
@property (nonatomic, copy) NSString *footer;

/** 每一组所有的cells*/
@property (nonatomic, strong) NSArray *cells;

@end
