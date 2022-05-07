//
//  ViewController.m
//  GrowDemo
//
//  Created by 谢吴军 on 2021/2/5.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *taskArray;

@property (strong, nonatomic) dispatch_queue_t queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     需求：
     1.用户不断地点击某个按钮（可以模拟自动点击按钮）
     2.将点击事件加入队列中（队列最大数量10个元素）
     3.开始依次网络请求（失败重复3次，再次失败放在队列最后）
     4.如果达到极限，后续数据丢弃
     */
    self.taskArray = [[NSMutableArray alloc]init];
    self.queue = dispatch_queue_create("com.growdemo.www", DISPATCH_QUEUE_SERIAL);
    // 模拟点击按钮
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(sGrow) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer fire];
}

-(void)sGrow {
    if (self.taskArray.count > 10) {
        return;
    }
    [self.taskArray addObject:@"0001"];
    [self.taskArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_async(self.queue, ^{
            [self commitLog:obj];
        });
    }];
}

-(void)commitLog:(id _Nonnull)obj {
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setValue:obj forKey:@"optype"];
    [param setValue:@(2) forKey:@"os"];
    [param setValue:@"123456" forKey:@"device_id"];
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 @"123456", @"game_id",
                                 @"123456", @"ch_id",
                                 @(123456), @"scr_width",
                                 @(123456), @"scr_height",
                                 @"123456", @"occur_time",
                                 @"sdk_init", @"event", nil];
    [param setValue:data forKey:@"data"];
    
    __weak typeof(self) weakSelf = self;
    [self addRetryRequestWithUrlString:@"sdk/dss/data/receive" body:[self makeJSON:param] currentRetry:1 maxRetry:3 completion:^(id result) {
        NSMutableDictionary *dataResult = (NSMutableDictionary *)result;
        if (dataResult == nil) {
            NSLog(@"GrowDemo ==> event-sdk_initFail");
            // 此处需要重新放入队列
            [weakSelf.taskArray addObject:weakSelf.taskArray.firstObject];
            [weakSelf.taskArray removeObjectAtIndex:0];
        } else {
            if ([[dataResult objectForKey:@"ret_code"] intValue] != 0) {
                NSLog(@"GrowDemo ==> event-sdk_initFail");
                // 此处需要重新放入队列
                [weakSelf.taskArray addObject:weakSelf.taskArray.firstObject];
                [weakSelf.taskArray removeObjectAtIndex:0];
                return;
            }
            NSLog(@"GrowDemo ==> event-sdk_initSuccess");
            //[weakSelf.taskArray removeObjectAtIndex:0];
        }
    }];
}

-(void)sendRequestWithUrlString:(NSString *)urlString
                           body:(NSString *)body
                     completion:(void (^)(id))block {
    // 1.操作url
    NSString *string = [NSString stringWithFormat:@"%@/%@", @"http://dcms.plat.x.thedream.cc", urlString];
    NSString *urlPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:string]];
    NSURL *url = [NSURL URLWithString:urlPath];
    // 2.操作request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = data;
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

-(void)addRetryRequestWithUrlString:(NSString *)urlString
                               body:(NSString *)body
                       currentRetry:(NSInteger)currentRetry
                           maxRetry:(NSInteger)maxRetry
                         completion:(void (^)(id))block {
    __weak typeof(self) weakSelf = self;
    [self sendRequestWithUrlString:urlString
                              body:body
                        completion:^(id result) {
        NSMutableDictionary *dataResult = (NSMutableDictionary *)result;
        if (dataResult == nil && currentRetry > maxRetry) {
            [weakSelf addRetryRequestWithUrlString:urlString body:body currentRetry:(currentRetry + 1) maxRetry:maxRetry completion:block];
        } else {
            if ([[dataResult objectForKey:@"ret_code"] intValue] != 0 && currentRetry > maxRetry) {
                [weakSelf addRetryRequestWithUrlString:urlString body:body currentRetry:(currentRetry + 1) maxRetry:maxRetry completion:block];
                return;
            }
            block(result);
        }
    }];
}

-(NSString *)makeJSON:(id)object {
    NSString *jsonString = [[NSString alloc] init];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
    if (!jsonData) {
        jsonString = @"";
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
