//
//  CarSalesRequestFunc.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "CarSalesRequestFunc.h"

@implementation CarSalesRequestFunc

+(void)sendRequestWithType:(CarSalesNetworkType)requestType
                      path:(NSString *)path
                parameters:(id _Nullable)parameters
             responseBlock:(CarSalesNetResponseBlock)responseBlock {
    // 没有网络直接返回
    AFNetworkReachabilityStatus status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    if (status == AFNetworkReachabilityStatusNotReachable) {
        NSError *error = [NSError errorWithDomain:@"netConnectError" code:0 userInfo:nil];
        responseBlock(nil, error);
        return;
    }
    // 拼接url
    NSString *urlPath = [NSString stringWithFormat:@"%@/%@", [CarSalesConst getInstance].hostName, path];
    NSMutableDictionary *params = [CarSalesUtilsFunc SignWithParams:parameters];
    if ([CarSalesConst getInstance].isDebug) {
        NSLog(@"CarSalesSDK => Request Url == %@, Params == %@", urlPath, params);
    }
    // 设置属性
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = [CarSalesConst getInstance].httpRequestTimeCount; // 请求持续时间
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];  // 请求体格式
    manager.responseSerializer.acceptableContentTypes =
    [NSSet setWithObjects:@"application/json", @"text/json", @"text/plain", @"text/javascript", @"text/html", nil];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer]; // 返回体格式

    NSURLSessionDataTask *task = nil;
    switch (requestType) {
        case GetType: {
            task = [manager GET:urlPath parameters:params headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                responseBlock(responseObject, nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                responseBlock(nil, error);
            }];
        }
            break;
        case PostType: {
            task = [manager POST:urlPath parameters:params headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                responseBlock(responseObject, nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                responseBlock(nil, error);
            }];
        }
            break;
    }
}

+(void)sendRequestWithType:(CarSalesNetworkType)requestType
                 urlString:(NSString *)urlString
                      body:(NSString *)body
                completion:(void (^)(id))block {
    // 1.操作url
    NSString *string = [NSString stringWithFormat:@"%@/%@", [CarSalesConst getInstance].hostName, urlString];
    NSString *urlPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:string]];
    NSURL *url = [NSURL URLWithString:urlPath];
    // 2.操作request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    switch (requestType) {
        case GetType: {
            request.HTTPMethod = @"GET";
        }
            break;
        case PostType: {
            request.HTTPMethod = @"POST";
        }
            break;
    }
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
    if ([CarSalesConst getInstance].isDebug) {
        NSLog(@"CarSalesSDK => Request Url == %@, Params == %@", urlPath, body);
    }
    // 3.请求
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSMutableDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
            block(jsonResult);
        } else {
            block(nil);
        }
    }];
    // 4.执行
    [task resume];
}

+(void)addRetryRequestWithType:(CarSalesNetworkType)requestType
                          path:(NSString *)path
                    parameters:(id _Nullable)parameters
                 responseBlock:(CarSalesNetResponseBlock)responseBlock {
    __weak typeof(self) weakSelf = self;
    [CarSalesRequestFunc sendRequestWithType:requestType path:path parameters:parameters responseBlock:^(id  _Nullable jsonResult, NSError * _Nullable error) {
        if (error) {
            [weakSelf addRetryRequestWithType:requestType path:path parameters:parameters responseBlock:responseBlock];
        } else {
            NSMutableDictionary *result = (NSMutableDictionary *)jsonResult;
            if ([[result safeObjectForKey:@"ret_code"] intValue] != 0) {
                [weakSelf addRetryRequestWithType:requestType path:path parameters:parameters responseBlock:responseBlock];
                return;
            }
            responseBlock(jsonResult, nil);
        }
    }];
}

+(void)addRetryRequestWithType:(CarSalesNetworkType)requestType
                     urlString:(NSString *)urlString
                          body:(NSString *)body
                    completion:(void (^)(id))block {
    __weak typeof(self) weakSelf = self;
    [CarSalesRequestFunc sendRequestWithType:requestType
                                urlString:urlString
                                     body:body
                               completion:^(id result) {
        NSMutableDictionary *dataResult = (NSMutableDictionary *)result;
        if (dataResult == nil) {
            [weakSelf addRetryRequestWithType:requestType urlString:urlString body:body completion:block];
        } else {
            if ([[dataResult safeObjectForKey:@"ret_code"] intValue] != 0) {
                [weakSelf addRetryRequestWithType:requestType urlString:urlString body:body completion:block];
                return;
            }
            block(result);
        }
    }];
}

@end
