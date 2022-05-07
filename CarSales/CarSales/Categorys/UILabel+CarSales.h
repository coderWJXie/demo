//
//  UILabel+CarSales.h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (CarSales)

+(UILabel *)makeLabel:(UIFont *)font text:(NSString *)text
            textColor:(UIColor *)color numberLine:(NSInteger)numberLine
            alignment:(NSTextAlignment)textAlignment;

-(void)setContentCompressionHugging;

@end

NS_ASSUME_NONNULL_END
