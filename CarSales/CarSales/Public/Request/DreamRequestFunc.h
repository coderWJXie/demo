//
//  CarSalesRequestFunc.h
//  DreamSDK
//
//  Created by 谢吴军 on 2020/7/20.
//  Copyright © 2020 谢吴军. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarSalesRequestFunc : NSObject
// 不需要手动加_ver参数
+(void)sendRequestWithType:(DreamNetworkType)requestType
                      path:(NSString *)path
                parameters:(id _Nullable)parameters
             responseBlock:(DreamNetResponseBlock)responseBlock;
// 需要手动加_ver参数
+(void)sendRequestWithType:(DreamNetworkType)requestType
                 urlString:(NSString *)urlString
                      body:(NSString *)body
                completion:(void (^)(id))block;
// 不需要手动加_ver参数
+(void)addRetryRequestWithType:(DreamNetworkType)requestType
                          path:(NSString *)path
                    parameters:(id _Nullable)parameters
                 responseBlock:(DreamNetResponseBlock)responseBlock;
// 需要手动加_ver参数
+(void)addRetryRequestWithType:(DreamNetworkType)requestType
                     urlString:(NSString *)urlString
                          body:(NSString *)body
                    completion:(void (^)(id))block;

@end

NS_ASSUME_NONNULL_END
