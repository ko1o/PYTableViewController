//  代码地址: https://github.com/iphone5solo/PYTableViewController
//  代码地址: http://code4app.com/thread-8530-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//
#import "PYExampleTableViewController.h"
#import "PYTempViewController.h"
#import "PYTableViewCell.h"

#define PYTitle @"标题"
#define PYAccessoryTitle @"附加说明"
#define PYIcon @"setting"

@interface PYExampleTableViewController ()

@end

@implementation PYExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    [self setup];
    
    // 创建组一
    [self createGroup1];
    
    // 创建组二
    [self createGroup2];

    // 创建组三
    [self createGroup3];

    // 创建组四
    [self createGroup4];
    
    // 创建组五
    [self createGroup5];
    
    // 创建组六
    [self createGroup6];

}

/** 初始化 */
- (void)setup
{
    self.title = @"PYTableViewController";
}

/** 创建第六组 */
- (void)createGroup6
{
    PYGroup *group6 = [[PYGroup alloc] init];
    group6.header = @"单选样式";
    
    PYCheckCell *cell1 = [PYCheckCell cellWithTitle:@"男" didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 单选选中时，执行代码写在这里
        NSLog(@"选中---男");
    }];
    PYCheckCell *cell2 = [PYCheckCell cellWithTitle:@"女" didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 单选选中时，执行代码写在这里
        NSLog(@"选中---女");
    }];
    
    // 添加所有cell
    group6.cells = (NSMutableArray *)@[cell1, cell2];
    
    // 添加组到所有组中
    [self.groups addObject:group6];
}

/** 创建第五组 */
- (void)createGroup5
{
    PYGroup *group5 = [[PYGroup alloc] init];
    group5.header = @"文本按钮样式";
    
    PYLabelCell *cell1 = [PYLabelCell cellWithText:@"退出登录" didSelectedCell:^(PYTableViewCell *selectedCell) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"退出后不会删除任何历史数据，下次登录依然可以使用本账号" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"退出登录" otherButtonTitles:nil, nil];
        [sheet showInView:self.view];
    }];
    
    // 自定义label
    UILabel *label = [[UILabel alloc] init];
    label.text = @"自定义label";
    label.textColor = PYRandomColor;
    label.font = [UIFont systemFontOfSize:22];
    label.size = CGSizeMake(PYScreenW, 44);
    PYLabelCell *cell2 = [PYLabelCell cellWithLabel:label didSelectedCell:^(PYTableViewCell *selectedCell) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"这是自定义Label的操作" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [sheet showInView:self.view];
    }];
    
    // 添加所有cell
    group5.cells = (NSMutableArray *)@[cell1, cell2];
    
    // 添加组到所有组中
    [self.groups addObject:group5];
}


/** 创建第四组 */
- (void)createGroup4
{
    PYGroup *group4 = [[PYGroup alloc] init];
    group4.header = @"详情样式";
    
    // 执行选中详情cell的操作
    void (^operation)() = ^{
        PYTempViewController *tempVc = [[PYTempViewController alloc] init];
        [self.navigationController pushViewController:tempVc animated:YES];
    };
    PYDetailCell *cell1 = [PYDetailCell cellWithTitle:PYTitle didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 执行操作代码写在这里
        operation();
    }];
    PYDetailCell *cell2 = [PYDetailCell cellWithTitle:PYTitle accessoryTitle:PYAccessoryTitle];
    // 为cell2添加执行操作
    cell2.option = ^(PYTableViewCell *selectedCell) {
        // 执行操作代码写在这里
        operation();
    };
    // 自定义辅助view
    UIView *accessoryView1 = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 30, 30)];
    accessoryView1.backgroundColor = PYRandomColor;
    PYDetailCell *cell3 = [PYDetailCell cellWithTitle:PYTitle accessoryView:accessoryView1 didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 执行操作代码写在这里
        operation();
    }];
    PYDetailCell *cell4 = [PYDetailCell cellWithTitle:PYTitle icon:@"setting" didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 执行操作代码写在这里
        operation();
    }];
    
    // 添加所有cell
    group4.cells = (NSMutableArray *)@[cell1, cell2, cell3, cell4];
    
    // 添加组到所有组中
    [self.groups addObject:group4];
    
}

/** 创建第三组 */
- (void)createGroup3
{
    PYGroup *group3 = [[PYGroup alloc] init];
    group3.header = @"开关样式";
    
    // 开关值变化时所作的操作
    void (^operation)(UISwitch *switchButton, PYTableViewCell *tableViewCell, UITableView *tableView) = ^(UISwitch *switchButton, PYTableViewCell *tableViewCell, UITableView *tableView){
        // 根据开关状态，执行相应操作
        NSIndexPath *indexPath = [tableView indexPathForCell:tableViewCell];
        if (switchButton.isOn) { // 开
            NSString *msg = [NSString stringWithFormat:@"开关状态：开\n选中的cell  组：%zd 行：%zd", indexPath.section, indexPath.row];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
            [alertView show];
        } else { // 关
            NSString *msg = [NSString stringWithFormat:@"开关状态：关\n选中的cell  组：%zd 行：%zd", indexPath.section, indexPath.row];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
            [alertView show];
        }
    };
    
    PYSwitchCell *cell1 = [PYSwitchCell cellWithTitle:PYTitle didClickSwitchButton:^(UISwitch *switchButton, PYTableViewCell *tableViewCell, UITableView *tableView) {
        // switch按钮点击时执行操作代码可以写在这里
        operation(switchButton, tableViewCell, tableView);
    }];
    
    PYSwitchCell *cell2 = [PYSwitchCell cellWithTitle:nil icon:PYIcon];
    // 为switchButton添加操作
    cell2.opeation = ^(UISwitch *switchButton, PYTableViewCell *tableViewCell, UITableView *tableView) {
        // switch按钮点击时执行操作代码可以写在这里
        operation(switchButton, tableViewCell, tableView);
    };
    
    PYSwitchCell *cell3 = [PYSwitchCell cellWithTitle:PYTitle icon:PYIcon didClickSwitchButton:^(UISwitch *switchButton, PYTableViewCell *tableViewCell, UITableView *tableView) {
        // switch按钮点击时执行操作代码可以写在这里
        operation(switchButton, tableViewCell, tableView);
    }];
    
    // 添加所有cell
    group3.cells = (NSMutableArray *)@[cell1, cell2, cell3];
    
    // 添加组到所有组中
    [self.groups addObject:group3];
}



/** 创建第二组 */
- (void)createGroup2
{

    // 执行选中cell的操作
    void (^operation)() = ^{
        PYTempViewController *tempVc = [[PYTempViewController alloc] init];
        [self.navigationController pushViewController:tempVc animated:YES];
    };
    // 默认样式
    PYArrowCell *cell1 = [PYArrowCell cellWithTitle:PYTitle didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 执行操作，为了方便，这里以上面的block来执行操作，使用者可以直接在这里写相应的操作代码
        operation();
    }];
    
    PYArrowCell *cell2 = [PYArrowCell cellWithTitle:PYTitle accessoryTitle:PYAccessoryTitle didSelectedCellTarget:self action:@selector(didSelectedCell:)];
    
    // 添加辅助视图
    UIView *accessoryView1 = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 30, 30)];
    accessoryView1.backgroundColor = PYRandomColor;
    PYArrowCell *cell3 = [PYArrowCell cellWithTitle:PYTitle accessoryView:accessoryView1];
    cell3.target = self;
    cell3.action = @selector(didSelectedCell:);
    
    PYArrowCell *cell4 = [PYArrowCell cellWithTitle:PYTitle icon:PYIcon didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 执行操作
        operation();
    }];
    PYArrowCell *cell5 = [PYArrowCell cellWithTitle:PYTitle icon:PYIcon accessoryTitle:PYAccessoryTitle didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 执行操作
        operation();
    }];
    
    // 添加辅助视图
    UIView *accessoryView2 = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 30, 30)];
    accessoryView2.backgroundColor = PYRandomColor;
    PYArrowCell *cell6 = [PYArrowCell cellWithTitle:PYTitle icon:PYIcon accessoryView:accessoryView2 didSelectedCell:^(PYTableViewCell *selectedCell) {
        // 执行操作
        operation();
    }];
    
    // 自定义样式
    PYArrowCell *cell7 = [PYArrowCell cellWithTitle:PYTitle icon:PYIcon accessoryTitle:PYAccessoryTitle];
    cell7.option = operation;
    cell7.titleFont = [UIFont boldSystemFontOfSize:25];
    cell7.titleColor = PYRandomColor;
    cell7.accessoryTitleColor = PYRandomColor;
    cell7.backgroundColor = PYRandomColor;
    
    
    // 快速创建组并添加到所有组中
    [self.groups addObject:[PYGroup groupWithHeader:@"箭头样式" cells:(NSMutableArray *)@[cell1, cell2, cell3, cell4, cell5, cell6, cell7]]];
    
}

/** 创建第一组 */
- (void)createGroup1
{
    PYGroup *group1 = [PYGroup groupWithHeader:@"普通样式"];
    // 默认样式
    PYCell *cell1 = [PYCell cellWithTitle:PYTitle];
    PYCell *cell2 = [PYCell cellWithTitle:PYTitle accessoryTitle:PYAccessoryTitle];
    // 辅助视图
    UIView *accessoryView1 = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 30, 30)];
    accessoryView1.backgroundColor = PYRandomColor;
    PYCell *cell3 = [PYCell cellWithTitle:PYTitle accessoryView:accessoryView1];
    PYCell *cell4 = [PYCell cellWithTitle:PYTitle icon:PYIcon];
    PYCell *cell5 =  [PYCell cellWithTitle:PYTitle icon:PYIcon accessoryTitle:PYAccessoryTitle];
    
    UIView *accessoryView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    accessoryView2.backgroundColor = PYRandomColor;
    PYCell *cell6 = [PYCell cellWithTitle:PYTitle icon:PYIcon accessoryView:accessoryView2];
    
    // 自定义样式
    PYCell *cell7 = [PYCell cellWithTitle:PYTitle icon:PYIcon accessoryTitle:PYAccessoryTitle];
    cell7.accessoryTitleFont = [UIFont systemFontOfSize:12];
    cell7.accessoryTitleColor = PYRandomColor;
    cell7.titleColor = [UIColor greenColor];
    cell7.titleFont = [UIFont boldSystemFontOfSize:25];
    cell7.backgroundColor = PYRandomColor;
    
    // 添加所有cell
    group1.cells = (NSMutableArray *)@[cell1, cell2, cell3, cell4, cell5, cell6, cell7];
    
    // 把组添加到所以组中
    [self.groups addObject:group1];
}

// 选中cell时调用
- (void)didSelectedCell:(PYTableViewCell *)selectedCell
{
    NSLog(@"选中的cell---%zd--%zd", selectedCell.indexPath.section, selectedCell.indexPath.row);
    PYTempViewController *tempVc = [[PYTempViewController alloc] init];
    [self.navigationController pushViewController:tempVc animated:YES];
}


@end
