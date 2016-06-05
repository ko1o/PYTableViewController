# PYTableViewController
- 这是一款对系统的UITableViewController的封装。通过简单的操作，快速完成一个基本的tableViewController

## 内容
* 开始
  * [什么地方会用到PYTableViewController](#什么地方会用到PYTableViewController)
  * [PYTableViewController框架的主要类](#PYTableViewController框架的主要类)
* 框架使用
  * [如何使用PYTableViewController](#如何使用PYTableViewController)
  * [具体使用（详情见示例程序中的PYExampleTableViewController）](#具体使用（详情见示例程序中的PYExampleTableViewController）)
  * [为选中cell时添加操作](#为选中cell时添加操作)
  
* [期待](#期待)
  
## <a id="什么地方会用到PYTableViewController"></a>什么地方会用到PYTableViewController
- 几乎每个像样软件都会用到UITableViewController，所以你就可以使用到PYTableViewController
- 主要用在`我的`模块、`个人信息`、`设置`等。如下是各大流行软件使用UITableViewContller的截图

![(img1)](https://github.com/iphone5solo/learngit/raw/master/imagesForPYTableViewController/IMG_0209.PNG)
![(img1)](https://github.com/iphone5solo/learngit/raw/master/imagesForPYTableViewController/IMG_0210.PNG)
![(img1)](https://github.com/iphone5solo/learngit/raw/master/imagesForPYTableViewController/IMG_0211.PNG)
![(img1)](https://github.com/iphone5solo/learngit/raw/master/imagesForPYTableViewController/IMG_0212.PNG)
![(img1)](https://github.com/iphone5solo/learngit/raw/master/imagesForPYTableViewController/IMG_0213.PNG)
![(img1)](https://github.com/iphone5solo/learngit/raw/master/imagesForPYTableViewController/IMG_0214.PNG)
![(img1)](https://github.com/iphone5solo/learngit/raw/master/imagesForPYTableViewController/IMG_0215.PNG)

## <a id="PYTableViewController框架的主要类"></a>PYTableViewController框架的主要类

本框架的设计是使用MVC设计模式，所有组和cell都是通过模型`PYGroup`、`PYCell`这两个类及其子类组成

### <a id="PYCell的子类"></a>PYCell的子类
```objc

PYArrowCell		PYCheckCell	  PYDetailCell	
PYLabelCell		PYSwitchCell

```

### PYTableViewController
```objc

@interface PYTableViewController : UITableViewController

/** tableView的所有组,包含着是PYGroup模型 */
@property (nonatomic, strong) NSMutableArray *groups;

/** 选中的cell */
@property (nonatomic, strong) PYTableViewCell *selectedCell;

@end

```

### PYGroup
```objc


@interface PYGroup : NSObject

/** 头部标题 */
@property (nonatomic, copy) NSString *header;

/** 尾部标题 */
@property (nonatomic, copy) NSString *footer;

/** 每一组所有的cells,每一组都是PYCell模型 */
@property (nonatomic, strong) NSMutableArray *cells;

@end

```


## <a id="如何使用PYTableViewController"></a>如何使用PYTableViewController
* 手动导入：
  - 将`PYTableViewContreoller`文件夹中的所有文件拽入项目中
  - 创建一个tableViewController继承`PYTableViewController`
  
### <a id="具体使用（详情见示例程序中的PYExampleTableViewController）"></a>具体使用（详情见示例程序中的PYExampleTableViewController）:
1. 通过继承`PYTableViewController`类创建tableViewController
2. 通过模型`PYGroup`创建组group
3. 通过模型`PYCell`及其子类模型创建cell
4. 添加所有cell到group.cells数组中
5. 添加所有组到tableViewController.groups数组中

示例代码：

```objc
  // 以下代码是放在继承PYTableViewController的tableViewController的viewDidLoad方法中，self代表tableViewController对象
  
  // 1. 创建组group
  PYGroup *group = [[PYGroup alloc] init];
  
  // 2. 创建cell
  PYCell *cell = [PYCell cellWithTitle:PYTitle];
  
  // 3. 添加所有cell
  group.cells = (NSMutableArray *)@[cell1];
  
  // 4. 把组添加到所以组中
  [self.groups addObject:group];
  
```
  
## <a id="为选中cell时添加操作"></a>为选中cell时添加操作
#### 注意：当下面两种方法同时实现，优先选用回调对象(target)和回调方法(SEL)，即block不再调用

* 通过回调（block）

```objc
 // 在创建cell时，直接通过block为选中cell添加操作。
  PYArrowCell *cell = [PYArrowCell cellWithTitle:PYTitle didSelectedCell:^(PYTableViewCell *selectedCell, UITableView *tableView) {
    // 使用者可以直接在这里写相应的操作代码
  }];
  // 或者
  // 创建cell
  PYArrowCell *cell = [PYArrowCell cellWithTitle:PYTitle accessoryTitle:PYAccessoryTitle];
  // 为cell的option属性赋值一个block添加操作
  cell.option = ^(PYTableViewCell *selectedCell, UITableView *tableView) {
    // 使用者可以直接在这里写相应的操作代码
  };
```

* 通过回调对象(target)和回调方法(SEL)

```objc
	// 在创建cell时，直接通过添加参数taeget和action为cell添加操作
	PYArrowCell *cell = [PYArrowCell cellWithTitle:PYTitle accessoryTitle:PYAccessoryTitle didSelectedCellTarget:self action:@selector(didSelectedCell:)];
	// 或者
	// 创建cell
    PYArrowCell *cell = [PYArrowCell cellWithTitle:PYTitle accessoryView:accessoryView1];
    // 设置回调对象
    cell.target = self;
    // 设置回调方法(使用者可以直接在这个方法中添加相应的操作代码)
    cell.action = @selector(didSelectedCell:);
```


## <a id="期待"></a>期待
- 如果在使用过程中遇到BUG,希望您呢个Issues我，谢谢（或者尝试下载最新的框架代码看看BUG修复没有）
- 如果在使用过程中发现功能不够用，希望你能Issues我，我非常想为这个框架增加更多好用的功能，谢谢
- 如果你想为PYTableViewController输出代码，请拼命Pull Requests我
