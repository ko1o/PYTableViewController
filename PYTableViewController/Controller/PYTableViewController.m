//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYTableViewController.h"

@interface PYTableViewController ()<PYTableViewCellDelegate, PYTableViewCellDataSource>

@end

@implementation PYTableViewController

#pragma mark settings
- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}


#pragma mark - 初始化
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)setSeparatorStyle:(PYTableViewCellSeparatorStyle)separatorStyle
{
    _separatorStyle = separatorStyle;
    if (separatorStyle == PYTableViewCellSeparatorStyleDefault) return;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma  mark - datasource
// 返回组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

// 返回每组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 获取对象
    PYGroup *group = self.groups[section];
    return  group.cells.count;
    
}

// 返回每一行的内容
- (PYTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // 获取模型
    PYGroup *group = self.groups[indexPath.section];
    PYCell *item = group.cells[indexPath.row];
    
    // 创建自定义cell
    PYTableViewCell*cell = [PYTableViewCell cellWithTableView:tableView];
    // 设置代理
    cell.delegate = self;
    cell.dataSource = self;
    
    // 绑定cell（注意：必须先绑定cell再设置数据，因为在设置cell数据时用到了tableViewCell）
    item.tableViewCell = cell;
    // 设置cell数据
    cell.item = item;
    // 设置分隔线样式（注意：必须要先设置完item，才能设置分隔线样式）
    cell.pyseparatorStyle = self.separatorStyle;
    // 设置自定义分隔线(注意: 先确定样式，再自定义)
    cell.separatorView = self.separatorView;
    
    return cell;
}

// 设置组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 获取模型
    PYGroup *group = self.groups[section];
    return group.header;
}

// 设置尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 获取模型
    PYGroup *group = self.groups[section];
    return group.footer;
}


// 选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取模型
    PYGroup *group = self.groups[indexPath.section];
    PYCell *item = group.cells[indexPath.row];
    
    PYTableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    // 如果PYCheckCell
    if ([[item class] isSubclassOfClass:[PYCheckCell class]]) {
        // 获取当前组
        for (PYCheckCell *cell in group.cells) {
            cell.checked = [cell isEqual:item];
        }
        // 刷新cell
        NSIndexSet *set = [NSIndexSet indexSetWithIndex:indexPath.section];
        [tableView reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
    }
    // 如果PYLabelCell
    if ([[item class] isSubclassOfClass:[PYLabelCell class]]) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    // 执行操作(当两种方法同时实现，优先执行回调对象和对调方法，忽略block)
    if ([item.target respondsToSelector:item.action]) { // 实现方法
        [item.target performSelector:item.action withObject:selectedCell];
    } else  if (item.option) {
        item.option(selectedCell);
    }
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取模型
    PYGroup *group = self.groups[indexPath.section];
    PYCell *item = group.cells[indexPath.row];
    
    return item.height;
}

#pragma mark - 辅助按钮被点击
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    PYGroup *group = self.groups[indexPath.section];
    PYCell *item = group.cells[indexPath.row];
    
    PYTableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    // 执行操作
    if (item.option) item.option(selectedCell);
}
@end
