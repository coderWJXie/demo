//
//  NSDictionary+CarSales.h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (CarSales)

-(id)safeObjectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
