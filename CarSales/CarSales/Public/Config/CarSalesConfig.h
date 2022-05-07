//
//  CarSalesConfig_h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#ifndef CarSalesConfig_h
#define CarSalesConfig_h

//// 解决静态库不能使用Category的问题
//#define CARSALES_FIX_CATEGORY_BUG(name) @interface CARSALES_FIX_CATEGORY_BUG_##name: NSObject @end \
//@implementation CARSALES_FIX_CATEGORY_BUG_##name @end

// 屏幕尺寸
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height












//#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
//[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
//
//// RGB颜色
//#define UIColorFromRGB(rgbValue) [UIColor \
//colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
//green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
//blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//
//#define WHITE_COLOR [UIColor whiteColor]
//#define BALACK_COLOR [UIColor blackColor]
//
//#define NIGHT_COLOR RGBA(22, 40, 64, 1)
//#define DAY_COLOR RGBA(160, 186, 190, 1)
//#define KAlpha 0.8
//#define KChangeColorTime 1



#if DEBUG

#define kBackgroundColor [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing.jpg"]]

#define NSLog(FORMAT, ...) fprintf(stderr, "[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define NSLog(FORMAT, ...) nil

#endif

// 如果是DEBUG模式用测试服务器地址
#if DEBUG

#define     HttpBaseURL        @"http://www.test.com/" // 测试服务器

#else

#define     HttpBaseURL        @"http://www.baidu.com/" // 正式服务器

#endif

typedef void(^CarSalesNetResponseBlock)(id _Nullable jsonResult, NSError * _Nullable error);

typedef NS_ENUM(NSUInteger, CarSalesNetworkType) {
    GetType,   // get请求方式
    PostType   // post请求方式
};

typedef NS_OPTIONS(NSUInteger, CarSalesPingFangType) {
    PingFangType_Regular,  // 常规字体
    PingFangType_Medium,    // 中粗字体
    PingFangType_Semibold  // 半黑字体
};

typedef NS_OPTIONS(NSUInteger, CarSalesCollectionCellBorderDirectionType) {
    BorderDirectionTop = 1 << 0,  // 顶部
    BorderDirectionBottom = 1 << 1, // 底部
    BorderDirectionLeft = 1 << 2,   // 左部
    BorderDirectionRight = 1 << 3   // 右部
};


#endif
