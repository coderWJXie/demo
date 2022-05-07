//
//  UIColor+CarSales.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "UIColor+CarSales.h"

@implementation UIColor (CarSales)

+(UIColor *)colorWithHexString:(NSString *)hexString {
    return [self colorWithHexString:hexString alpha:1.0];
}

+(UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat red, blue, grren;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = alpha;
            red = [self colorComponentFrom:colorString start:0 length:1];
            grren = [self colorComponentFrom:colorString start:1 length:1];
            blue = [self colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString start:0 length:1];
            red = [self colorComponentFrom:colorString start:1 length:1];
            grren = [self colorComponentFrom:colorString start:2 length:1];
            blue = [self colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: // #RRGGBB
            alpha = alpha;
            red = [self colorComponentFrom:colorString start:0 length:2];
            grren = [self colorComponentFrom:colorString start:2 length:2];
            blue = [self colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString start:0 length:2];
            red = [self colorComponentFrom:colorString start:2 length:2];
            grren = [self colorComponentFrom:colorString start:4 length:2];
            blue = [self colorComponentFrom:colorString start:6 length:2];
            break;
        default:
            [NSException raise:@"Invalid color value" format:@"%@", hexString];
            break;
    }
    return [UIColor colorWithRed:red green:grren blue:blue alpha:alpha];
}

+(CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *subString = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? subString : [NSString stringWithFormat:@"%@%@", subString, subString];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    return hexComponent / 255.0;
}

// 字体颜色
+(UIColor *)fc0 {
    return [UIColor colorWithHexString:@"FFFFFF"];
}
+(UIColor *)fc1 {
    return [UIColor colorWithHexString:@"B1B1B1"];
}
+(UIColor *)fc2 {
    return [UIColor colorWithHexString:@"737373"];
}
+(UIColor *)fc3 {
    return [UIColor colorWithHexString:@"F0543E"];
}
+(UIColor *)fc4 {
    return [UIColor colorWithHexString:@"747474"];
}
+(UIColor *)fc5 {
    return [UIColor colorWithHexString:@"F0543E"];
}
+(UIColor *)fc6 {
    return [UIColor colorWithHexString:@"F8931D"];
}
+(UIColor *)fc7 {
    return [UIColor colorWithHexString:@"000000"];
}
+(UIColor *)fc8 {
    return [UIColor colorWithHexString:@"585B68"];
}
+(UIColor *)fc9 {
    return [UIColor colorWithHexString:@"AAAAAA"];
}
+(UIColor *)fc10 {
    return [UIColor colorWithHexString:@"1D1F2B"];
}

// 背景颜色
+(UIColor *)bg0 {
    return [UIColor colorWithHexString:@"FFFFFF"];
}
+(UIColor *)bg1 {
    return [UIColor colorWithHexString:@"000000" alpha:0.35];
}
+(UIColor *)bg2 {
    return [UIColor colorWithHexString:@"F0543E"];
}
+(UIColor *)bg3 {
    return [UIColor colorWithHexString:@"F0543E"];
}
+(UIColor *)bg4 {
    return [UIColor colorWithHexString:@"F8931D"];
}
+(UIColor *)bg5 {
    return [UIColor colorWithHexString:@"747474"];
}
+(UIColor *)bg6 {
    return [UIColor colorWithHexString:@"F0543E" alpha:0.35];
}
+(UIColor *)bg7 {
    return [UIColor colorWithHexString:@"E6E6E6"];
}
+(UIColor *)bg8 {
    return [UIColor colorWithHexString:@"DCDCDC"];
}
+(UIColor *)bg9 {
    return [UIColor colorWithHexString:@"000000" alpha:0.05];
}
+(UIColor *)bg10 {
    return [UIColor colorWithHexString:@"232323"];
}
+(UIColor *)bg11 {
    return [UIColor colorWithHexString:@"424242"];
}

@end
