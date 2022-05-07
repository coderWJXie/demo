//
//  UIFont+CarSales.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "UIFont+CarSales.h"

@implementation UIFont (CarSales)

+(UIFont *)scWithType:(CarSalesPingFangType)type size:(CGFloat)size {
    NSString *fontName = @"PingFangSC-Regular";
    switch (type) {
        case PingFangType_Medium:
            fontName = @"PingFangSC-Medium";
            break;
        case PingFangType_Semibold:
            fontName = @"PingFangSC-Semibold";
            break;
        case PingFangType_Regular:
            fontName = @"PingFangSC-Regular";
            break;
        default:
            fontName = @"PingFangSC-Regular";
            break;
    }
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (font == nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+(UIFont *)dinotWithSize:(CGFloat)size {
    return [UIFont boldSystemFontOfSize:size];
}

@end
