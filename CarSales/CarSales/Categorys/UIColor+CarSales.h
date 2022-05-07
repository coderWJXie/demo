//
//  UIColor+CarSales.h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CarSales)

+(UIColor *)colorWithHexString:(NSString *)hexString;

+(UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

// 字体颜色
+(UIColor *)fc0;
+(UIColor *)fc1;
+(UIColor *)fc2;
+(UIColor *)fc3;
+(UIColor *)fc4;
+(UIColor *)fc5;
+(UIColor *)fc6;
+(UIColor *)fc7;
+(UIColor *)fc8;
+(UIColor *)fc9;
+(UIColor *)fc10;

// 背景颜色
+(UIColor *)bg0;
+(UIColor *)bg1;
+(UIColor *)bg2;
+(UIColor *)bg3;
+(UIColor *)bg4;
+(UIColor *)bg5;
+(UIColor *)bg6;
+(UIColor *)bg7;
+(UIColor *)bg8;
+(UIColor *)bg9;
+(UIColor *)bg10;
+(UIColor *)bg11;

@end

NS_ASSUME_NONNULL_END
