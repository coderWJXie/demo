//
//  NSDictionary+CarSales.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "NSDictionary+CarSales.h"

@implementation NSDictionary (CarSales)

-(id)safeObjectForKey:(NSString *)key {
    if (key != nil) {
        id value = self[key];
        
        if (value && ![value isKindOfClass:[NSNull class]]) {
            return value;
        }
    }
    return nil;
}

@end
