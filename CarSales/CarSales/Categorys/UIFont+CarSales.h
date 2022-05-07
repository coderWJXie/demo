//
//  UIFont+CarSales.h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (CarSales)

+(UIFont *)scWithType:(CarSalesPingFangType)type size:(CGFloat)size;

+(UIFont *)dinotWithSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
