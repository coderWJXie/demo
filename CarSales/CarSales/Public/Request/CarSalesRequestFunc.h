//
//  CarSalesRequestFunc.h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarSalesRequestFunc : NSObject
// 不需要手动加_ver参数
+(void)sendRequestWithType:(CarSalesNetworkType)requestType
                      path:(NSString *)path
                parameters:(id _Nullable)parameters
             responseBlock:(CarSalesNetResponseBlock)responseBlock;
// 需要手动加_ver参数
+(void)sendRequestWithType:(CarSalesNetworkType)requestType
                 urlString:(NSString *)urlString
                      body:(NSString *)body
                completion:(void (^)(id))block;
// 不需要手动加_ver参数
+(void)addRetryRequestWithType:(CarSalesNetworkType)requestType
                          path:(NSString *)path
                    parameters:(id _Nullable)parameters
                 responseBlock:(CarSalesNetResponseBlock)responseBlock;
// 需要手动加_ver参数
+(void)addRetryRequestWithType:(CarSalesNetworkType)requestType
                     urlString:(NSString *)urlString
                          body:(NSString *)body
                    completion:(void (^)(id))block;

@end

NS_ASSUME_NONNULL_END
