//
//  CarSalesUtilsFunc.h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarSalesUtilsFunc : NSObject

+ (BOOL)isEmptyString:(NSString *)string;
+ (NSString *)stringByTrim:(NSString *)string;

+ (CGFloat)getDeviceHeight;
+ (CGFloat)getDeviceWidth;
+ (NSString *)getDeviceIDFA;
+ (NSString *)getDeviceIDFV;
+ (NSString *)getDevicePhoneType;
+ (NSString *)getDevicePhoneVersion;
//+ (NSString *)getUserAgent;

+ (void)showHudWithText:(NSString *)text;
+ (void)showLoadingHub;
+ (void)hideLoadingHub;

+ (NSString *)makeSHA1:(NSString *)input;
+ (NSString *)makeJSON:(id)object;
+ (NSString *)md5:(NSString *)text;

+ (NSString *)getCurrentTimeStamp;
+ (NSString *)getVersion;

+ (CGFloat)statusBarHeight;
+ (UIWindow *)keyWindow;
+ (UIWindow *)getCurrentWindow;
+ (UIViewController *)getCurrentViewController;

+ (NSInteger)retMinWithFirstNum:(NSInteger)firstNum
                      secondNum:(NSInteger)secondNum
                       thirdNum:(NSInteger)thirdNum;
+ (NSDate *)getTime:(NSInteger)hour
              minute:(NSInteger)minute
              second:(NSInteger)second;
+ (NSString *)getDateTimeStamp:(NSDate *)date;
+ (void)closeTimer:(NSTimer *_Nullable)timer;
+ (void)openTimer:(NSTimer *_Nullable)timer;

// 根据颜色生成一张图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
// 给图片切圆角
+ (UIImage *)setCornerWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;
// 根据颜色生成一张图片并切圆角
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

+ (void)handleShow:(UIViewController *)controller;
+ (void)handleShow:(UIViewController *)controller
        completion:(void (^ __nullable)(void))completion;
+ (void)handleJumpWithCurrentController:(UIViewController *)currentController
                        nextController:(UIViewController *)nextController;
+ (void)handleJumpWithCurrentController:(UIViewController *)currentController
                         nextController:(UIViewController *)nextController
                               animated:(BOOL)isAnimated;
+ (void)dismissController:(UIViewController *)currentController
             isAllDismiss:(BOOL)isAllDismiss
               completion:(void (^ __nullable)(void))completion;
+ (void)dismissController:(UIViewController *)currentController
             isAllDismiss:(BOOL)isAllDismiss
                 animated:(BOOL)isAnimated
               completion:(void (^ __nullable)(void))completion;

+ (NSMutableDictionary *)SignWithParams:(NSMutableDictionary *)params;












/**
*  @brief 判断是否是同一天
*  用于弹窗逻辑
*/
+ (BOOL)isShowAlertViewSameDay;

/**
*  @brief 判断是否是用一月
*  用于弹窗逻辑
*/
+ (BOOL)isShowAlertViewSameMonth;

/**
*  @brief 保存当天的在线时长
*  用于弹窗逻辑
*/
+ (void)setTodayOnlineTimeDict:(NSMutableDictionary *_Nullable)mOnlineTimeDict;
+ (NSMutableDictionary *_Nullable)getTodayOnlineTimeDict:(NSString *)session_token;

/**
*  @brief 保存第二天的在线时长
*  用于弹窗逻辑
*/
+ (void)setTomorrowOnlineTimeDict:(NSMutableDictionary *_Nullable)mOnlineTimeDict;
+ (NSMutableDictionary *_Nullable)getTomorrowOnlineTimeDict:(NSString *)session_token;



@end

NS_ASSUME_NONNULL_END
