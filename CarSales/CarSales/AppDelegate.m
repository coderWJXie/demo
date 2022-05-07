//
//  AppDelegate.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "AppDelegate.h"
#import "CSTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 1.删除SceneDelegate
// 2.修改适配iOS版本
// 3.删除storyboard启动
// UIWindow - UITabBarViewController（1个） - UINavigationViewController（多个）
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // ？？？LaunchScreen原理？？？
    /*
     ？？？需要实践一下？？？
     // App首次进入
     广告业->启动页->App起始三句话->定制导航栏/分栏->initSDK(保存参数->检查网络->上传设备信息->本身init(设置AutoLogin->补单->获取用户)->三方init->统计->更新->公告)->新手引导
     // App二次进入
     启动页->App起始三句话->定制导航栏/分栏->initSDK(保存参数->检查网络->上传设备信息->本身init(设置AutoLogin->补单->获取用户)->三方init->统计->更新->公告)
     */
    // 0.相关初始化操作可以放这里
    // 1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    // 2.设置窗口rootViewController
    if ([CarSalesConst getInstance].isEnterLoginPage) {
        // 刚进入App就需要登录
        self.window.rootViewController = [[CSTabBarController alloc]init];
    } else {
        // 刚进入App不需要登录
        self.window.rootViewController = [[CSTabBarController alloc]init];
    }
    // 3.让窗口显示
    [self.window makeKeyAndVisible];
    // 4.“广告业->启动页”放这里（涉及到UI部分放在UIWindow后面）
    // 5.统一UI设置
    if (@available(iOS 15.0, *)) {
        UITableView.appearance.sectionHeaderTopPadding = 0;
    }
    return YES;
}

@end
