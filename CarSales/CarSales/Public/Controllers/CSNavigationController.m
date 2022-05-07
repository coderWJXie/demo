//
//  CSNavigationController.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "CSNavigationController.h"

@interface CSNavigationController ()

@end

@implementation CSNavigationController
// 配置全局默认的navigationBar样式
+ (void)initialize {
    // iOS15+的导航栏默认透明（需要手动设置）
    // https://www.jianshu.com/p/9b519673dcbd
    // https://baijiahao.baidu.com/s?id=1711749740139600655&wfr=spider&for=pc
    // ！！！导航栏无论透明还是非透明不影响坐标系的位置！！！
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc]init];
        navigationBarAppearance.backgroundColor = UIColor.whiteColor;
        // self.navigationBar不能在类方法中使用
        // UINavigationBar.appearance - 获取App导航条标识
        UINavigationBar.appearance.scrollEdgeAppearance = navigationBarAppearance;
    } else {
        // Fallback on earlier versions
    }
    
//    // 统一定制UI（继承于UIView）都可以使用该方法
//    // UIButton.appearance
//    // UILabel.appearance
//    // 重大bug：只要设置这个就会让整个App的导航栏保持一致
//    UINavigationBar *bar = UINavigationBar.appearance;
//    // 获取某几个类的导航栏
//    // 此处可以给部分导航栏定制（一部分不定制）
//    UINavigationBar *csBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[CSNavigationController class]]];
}

// 因为CSNavigationController不止被创建一次，所以自定义代码不可以写在此处
- (void)viewDidLoad {
    [super viewDidLoad];

}

@end
