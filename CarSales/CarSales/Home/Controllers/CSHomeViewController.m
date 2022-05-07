//
//  CSHomeViewController.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "CSHomeViewController.h"
#import "CSHomeTableViewCell.h"
#import "CSCityGroupsViewController.h"

@interface CSHomeViewController () <
UITableViewDataSource,
UITableViewDelegate
>

@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation CSHomeViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.showsVerticalScrollIndicator = NO;
//        // 凡是在导航条下面的UIScrollView都会默认设置偏移量（取消该操作：不要自动设置偏移量）
//        if (@available(iOS 11.0, *)) {
//            // 取消该操作以后可以自行设置contentInset
//            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        } else {
//            self.automaticallyAdjustsScrollViewInsets = NO;
//        }
        [_tableView registerClass:[CSHomeTableViewCell class] forCellReuseIdentifier:@""];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.自定义导航栏
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStylePlain target:self action:@selector(onTest)];
}

- (void)onTest {
    CSCityGroupsViewController *cityGroups_VC = [[CSCityGroupsViewController alloc] init];
    [self.navigationController pushViewController:cityGroups_VC animated:YES];
}



@end
