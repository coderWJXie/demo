//
//  CSCityGroupsViewController.m
//  CarSales
//
//  Created by 谢吴军 on 2022/3/17.
//

#import "CSCityGroupsViewController.h"


@interface CSCityGroupsViewController () <
UITableViewDelegate,
UITableViewDataSource
>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *cityGroupsArray;

@end

@implementation CSCityGroupsViewController
/*
 1.怎么去掉底部TabBar
 2.怎么去掉NavigationBar的默认返回键
 3.自定义cell和sectionHeader
 */
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 45;
        _tableView.sectionHeaderHeight = 25;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.showsVerticalScrollIndicator = NO;
//        if (@available(iOS 11.0, *)) {
//            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        } else {
//            self.automaticallyAdjustsScrollViewInsets = NO;
//        }
        // ？？？同一个App中CellReuseIdentifier可以一样吗？？？
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"城市选择";
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityGroups" ofType:@"plist"];
    self.cityGroupsArray = [NSArray arrayWithContentsOfFile:path];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cityGroupsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *cityGroupsDict = self.cityGroupsArray[section];
    NSArray *cityArray = cityGroupsDict[@"cities"];
    return  cityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *cityGroupsDict = self.cityGroupsArray[indexPath.section];
    NSArray *cityArray = cityGroupsDict[@"cities"];
    cell.textLabel.text = [cityArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *cityGroupsDict = self.cityGroupsArray[section];
    NSString *title = cityGroupsDict[@"title"];
    return title;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 点击
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    // 按照index匹配（不是按照字符串匹配）
    // 需要手动匹配
    NSMutableArray *titleArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in self.cityGroupsArray) {
        NSString *title = dict[@"title"];
        [titleArray addObject:title];
    }
    return titleArray;
}

@end
