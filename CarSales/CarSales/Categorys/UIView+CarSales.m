//
//  UIView+CarSales.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "UIView+CarSales.h"

@implementation UIView (CarSales)

-(void)makeCornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

@end
