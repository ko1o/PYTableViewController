//
//  PYTableViewController.m
//  youzhu
//
//  Created by 谢培艺 on 16/3/4.
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



#pragma  mark - datasource

// 返回组数
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
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
    
    // 执行操作
    if (item.option) item.option(selectedCell,tableView);

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取模型
    PYGroup *group = self.groups[indexPath.section];
    PYCell *item = group.cells[indexPath.row];
    
    return item.height;
}

#pragma mark - 辅助按钮被点就
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"辅助按钮被点击");
    
    PYGroup *group = self.groups[indexPath.section];
    PYCell *item = group.cells[indexPath.row];
    
    PYTableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    // 执行操作
    if (item.option) item.option(selectedCell,tableView);
}
@end
