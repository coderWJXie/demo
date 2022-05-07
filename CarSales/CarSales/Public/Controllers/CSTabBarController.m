//
//  CSTabBarController.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "CSTabBarController.h"
#import "CSNavigationController.h"
#import "CSHomeViewController.h"
#import "CSTalentViewController.h"
#import "CSMapViewController.h"
#import "CSMineViewController.h"


@interface CSTabBarController ()

@end

@implementation CSTabBarController

// 代码也可以写在此处
+ (void)initialize {
//    // 统一定制UI（继承于UIView）都可以使用该方法
//    // UIButton.appearance
//    // UILabel.appearance
//    // 重大bug：只要设置这个就会让整个App的UITabBar保持一致
//    UITabBar *bar = UITabBar.appearance;
//    // 获取某几个类的UITabBar
//    // 此处可以给部分UITabBar定制（一部分不定制）
//    UITabBar *csBar = [UITabBar appearanceWhenContainedInInstancesOfClasses:@[[CSTabBarController class]]];
}

// 因为CSTabBarController只会被创建一次，所以自定义代码可以写在此处
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // iOS15+的分栏默认透明（需要手动设置）
    // https://www.jianshu.com/p/9b519673dcbd
    // https://baijiahao.baidu.com/s?id=1711749740139600655&wfr=spider&for=pc
    if (@available(iOS 15.0, *)) {
        UITabBarAppearance *tabBarAppearance = [[UITabBarAppearance alloc]init];
        tabBarAppearance.backgroundColor = UIColor.whiteColor;
        self.tabBar.scrollEdgeAppearance = tabBarAppearance;
    } else {
        // Fallback on earlier versions
    }
    
    [self setUpChildViewController];
}

// FIXME
// 写代码遵循谁的事情谁做（解耦）
// ！！！此处可以继续封装！！！
// 防渲染
-(void)setUpChildViewController {
    CSNavigationController *homeNavigationVC = [[CSNavigationController alloc] initWithRootViewController:[[CSHomeViewController alloc] init]];
    // 高度为49...图片不能高于49（不然会超出）
    // 1.找UI替换图片
    /*
     2.自定义UITabBarController
     1>.移除TabBar
     [self setUpTabBar];
     */
    homeNavigationVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"home_tabbar_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"home_tabbar_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self addChildViewController:homeNavigationVC];

    // 此处可以通过if判断从而定制不同的UINavigationBar
    // 如果设置UINavigationBar.appearance则设置不成功（此处不能这样设置）
    CSNavigationController *talentNavigationVC = [[CSNavigationController alloc] initWithRootViewController:[[CSTalentViewController alloc] init]];
    talentNavigationVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"达人" image:[[UIImage imageNamed:@"talent_tabbar_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"talent_tabbar_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self addChildViewController:talentNavigationVC];
    
    // 此处使用UIImage可以直接设置Category
    CSNavigationController *mapNavigationVC = [[CSNavigationController alloc] initWithRootViewController:[[CSMapViewController alloc] init]];
    mapNavigationVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"地图" image:[[UIImage imageNamed:@"map_tabbar_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"map_tabbar_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self addChildViewController:mapNavigationVC];

    CSNavigationController *mineNavigationVC = [[CSNavigationController alloc] initWithRootViewController:[[CSMineViewController alloc] init]];
    mineNavigationVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"mine_tabbar_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"mine_tabbar_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self addChildViewController:mineNavigationVC];
}

/*
 -(void)setUpTabBar {
     // 1>.移除TabBar（此处self.tabBar还没有被销毁）
     [self.tabBar removeFromSuperview];
 //    // 2>.创建UIView（继承UITabBar）
 //    CSTabBar *tabBar = [[CSTabBar alloc] init];
 //    tabBar.count = self.childViewControllers.count;
 //    [self.view addSubview:tabBar];
 //    // 此处可以继续使用self.tabBar
 //    tabBar.frame = self.tabBar.frame;
       // 3>.CSTabBar内部使用UIButton（自己实现切换）
       // 4>.利用delegate将UIButton的点击实现传递出来
 } // 此处self.tabBar销毁
 */

@end
