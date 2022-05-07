//
//  UIButton+CarSales.h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CarSales)

+(UIButton *)makeButton:(UIFont *)font text:(NSString *)text
              textColor:(UIColor *)textColor bgColor:(UIColor *_Nullable)bgColor
              imageName:(NSString * _Nullable)imageName;

-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

-(void)setEnlargeEdgeWithTop:(CGFloat)top
                       right:(CGFloat)right
                      bottom:(CGFloat)bottom
                        left:(CGFloat)left;

@end

NS_ASSUME_NONNULL_END
