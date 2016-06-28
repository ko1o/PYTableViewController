#import <UIKit/UIKit.h>
#import "UIView+extension.h"

#define PYMargin 10

// 颜色
#define PYColor(r,g,b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]
#define PYRandomColor  PYColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))

// 屏幕宽高
#define PYScreenW [UIScreen mainScreen].bounds.size.width
#define PYScreenH [UIScreen mainScreen].bounds.size.height

// 分隔线颜色
#define PYTableViewCellSeparatorColor PYColor(223, 223, 223)
// 分隔线的左边距
#define PYTableViewCellSeparatorMarginLeft 20
// 分隔线样式
typedef NS_ENUM(NSInteger, PYTableViewCellSeparatorStyle) {
    PYTableViewCellSeparatorStyleDefault = 0,   // 系统默认分隔线
    PYTableViewCellSeparatorStyleNone = 1,  // 没有分隔线
    PYTableViewCellSeparatorStyleLongSingleLine = 2,   // 占据整个cell宽度的分隔线
    PYTableViewCellSeparatorStyleMarginSingleLine = 3,   // 分割线左边带有一定间距（一般用在左边有imageView，分隔线左边距就是相当于imageView的x）
    PYTableViewCellSeparatorStyleCustomView // 自定义分割线
};