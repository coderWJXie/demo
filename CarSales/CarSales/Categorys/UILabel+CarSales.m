//
//  UILabel+CarSales.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "UILabel+CarSales.h"

@implementation UILabel (CarSales)

+(UILabel *)makeLabel:(UIFont *)font text:(NSString *)text
textColor:(UIColor *)color numberLine:(NSInteger)numberLine
            alignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] init];
    if (font != nil) {
        label.font = font;
    }
    label.text = text;
    label.textColor = color;
    label.numberOfLines = numberLine;
    label.textAlignment = textAlignment;
    [label sizeToFit];
    return label;
}

-(void)setContentCompressionHugging {
    [self setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    [self setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
}

@end
