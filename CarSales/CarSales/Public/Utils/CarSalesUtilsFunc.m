//
//  CarSalesUtilsFunc.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "CarSalesUtilsFunc.h"

@implementation CarSalesUtilsFunc

+ (BOOL)isEmptyString:(NSString *)string {
    if (!string || string == nil ||
        string == (NSString *)[NSNull null] || string.length <= 0 ||
        [string isEqualToString:@""] || [string isEqualToString:@"(null)"]) {
        return YES;
    }
    return NO;
}

+ (NSString *)stringByTrim:(NSString *)string {
    NSString *str = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}

+ (CGFloat)getDeviceHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGFloat)getDeviceWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (NSString *)getDeviceIDFA {
    // 目前iOS14对用户隐私保护又一次进行升级，后续不授权可能无法获取IDFA
    // 考虑到无法授权可能会上架被拒绝，我们先行适配（后续考虑删除此处代码）
    // iOS14隐私适配及部分解决方案 - https://www.jianshu.com/p/1803bd950b90
    // https://www.jianshu.com/p/be37f85f73a6
    __block NSString *idfa = @"00000000-0000-0000-0000-000000000000";
    if (@available(iOS 14.0, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
            }
        }];
    } else {
        idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    }
    return idfa;
}

+ (NSString *)getDeviceIDFV {
    NSString * idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return idfv;
}

+ (NSString *)getDevicePhoneType {
    NSString *phoneType = [UIDevice platformString];
    return phoneType;
}

+ (NSString *)getDevicePhoneVersion {
    NSString *phoneVersion = [[UIDevice currentDevice] systemVersion];
    return phoneVersion;
}

+ (void)showHudWithText:(NSString *)text {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *view = (UIView *)[self getCurrentWindow];
        UILabel *customLabel = [UILabel makeLabel:[UIFont scWithType:PingFangType_Regular size:14.0]
                                       text:text
                                  textColor:UIColor.fc8
                                 numberLine:0
                                  alignment:NSTextAlignmentCenter];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
        hud.backgroundView.color = UIColor.bg1;
        hud.customView = customLabel;
        hud.margin = 16.0f;
        [hud.bezelView makeCornerRadius:12.5];
        [customLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
            make.width.mas_lessThanOrEqualTo([CarSalesConst getInstance].showToastMaxWidth);
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                     (int64_t)([CarSalesConst getInstance].showToastTimeCount * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:view animated:YES];
        });
    });
}

+ (void)showLoadingHub {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *view = (UIView *)[self getCurrentWindow];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.backgroundView.color = UIColor.bg1;
        hud.square = YES;
        [hud showAnimated:YES];
    });
}

+ (void)hideLoadingHub {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *view = (UIView *)[self getCurrentWindow];
        for (UIView *subView in view.subviews) {
            if ([subView isKindOfClass:[MBProgressHUD class]]) {
                MBProgressHUD *hud = (MBProgressHUD *)subView;
               [hud hideAnimated:YES];
            }
        }
    });
}

+ (NSString *)makeSHA1:(NSString *)input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

+ (NSString *)makeJSON:(id)object {
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

+ (NSString *)md5:(NSString *)text {
    const char *cStr = [text UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

+ (NSString *)getCurrentTimeStamp {
    NSTimeInterval nowTimeInterval = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld", (long)nowTimeInterval];
}

+ (NSString *)getVersion {
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return version;
}

+ (CGFloat)statusBarHeight {
    if (@available(iOS 13.0, *)) {
        return [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height;
    } else {
        return [UIApplication sharedApplication].statusBarFrame.size.height;
    }
}

+ (UIWindow *)keyWindow {
    static __weak UIWindow *cachedKeyWindow = nil;
    
    UIWindow *originalKeyWindow = nil;
    
    if (@available(iOS 13.0, *)) {
        NSSet<UIScene *> *connectedScenes = [UIApplication sharedApplication].connectedScenes;
        for (UIScene *scene in connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive && [scene isKindOfClass:[UIWindowScene class]]) {
                UIWindowScene *windowScene = (UIWindowScene *)scene;
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        originalKeyWindow = window;
                        break;
                    }
                }
            }
        }
    } else {
        originalKeyWindow = [UIApplication sharedApplication].keyWindow;
    }
    
    if (originalKeyWindow) {
        cachedKeyWindow = originalKeyWindow;
    }
    
    return cachedKeyWindow;
}

+ (UIWindow *)getCurrentWindow {
    UIWindow * window = [self keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}

+ (UIViewController *)getCurrentViewController {
    UIViewController *result = nil;
    UIWindow * window = [self keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}

+ (NSInteger)retMinWithFirstNum:(NSInteger)firstNum
                      secondNum:(NSInteger)secondNum
                       thirdNum:(NSInteger)thirdNum {
    NSInteger one_minNum = (firstNum < secondNum) ? firstNum : secondNum;
    NSInteger two_minNum = (one_minNum < thirdNum) ? one_minNum : thirdNum;
    return  two_minNum;
}

+ (NSDate *)getTime:(NSInteger)hour
             minute:(NSInteger)minute
             second:(NSInteger)second {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone systemTimeZone]];
    
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *dateComponentsForDate = [[NSDateComponents alloc] init];
    [dateComponentsForDate setYear:dateComponents.year];
    [dateComponentsForDate setMonth:dateComponents.month];
    [dateComponentsForDate setDay:dateComponents.day];
    [dateComponentsForDate setHour:hour];
    [dateComponentsForDate setMinute:minute];
    [dateComponentsForDate setSecond:second];
    NSDate *dateFromDateComponentsForDate = [calendar dateFromComponents:dateComponentsForDate];
    return  dateFromDateComponentsForDate;
}

+ (NSString *)getDateTimeStamp:(NSDate *)date {
    NSString *timeStamp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeStamp;
}

+ (void)closeTimer:(NSTimer *_Nullable)timer {
    if (timer) {
        [timer setFireDate:[NSDate distantFuture]];
    }
}

+ (void)openTimer:(NSTimer *_Nullable)timer {
    if (timer) {
        [timer setFireDate:[NSDate distantPast]];
    }
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) {
        return nil;
    }
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)setCornerWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, image.size.width, image.size.height) cornerRadius:cornerRadius];
    UIGraphicsBeginImageContext(image.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextAddPath(ctx, path.CGPath);
    CGContextClip(ctx);
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size
               cornerRadius:(CGFloat)cornerRadius {
    UIImage *image = [self imageWithColor:color size:size];
    UIImage *newImage = [self setCornerWithImage:image cornerRadius:cornerRadius];
    return newImage;
}

+ (void)handleShow:(UIViewController *)controller {
    controller.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [[self getCurrentViewController] presentViewController:controller animated:NO completion:nil];
}

+ (void)handleShow:(UIViewController *)controller
        completion:(void (^ __nullable)(void))completion {
    controller.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [[self getCurrentViewController] presentViewController:controller animated:NO completion:completion];
}

+ (void)handleJumpWithCurrentController:(UIViewController *)currentController
                         nextController:(UIViewController *)nextController {
    [self handleJumpWithCurrentController:currentController nextController:nextController animated:NO];
}

+ (void)handleJumpWithCurrentController:(UIViewController *)currentController
                         nextController:(UIViewController *)nextController
                               animated:(BOOL)isAnimated {
    nextController.modalPresentationStyle = UIModalPresentationFullScreen;
    [currentController presentViewController:nextController animated:isAnimated completion:nil];
}

+ (void)dismissController:(UIViewController *)currentController
             isAllDismiss:(BOOL)isAllDismiss
               completion:(void (^ __nullable)(void))completion {
    [self dismissController:currentController isAllDismiss:isAllDismiss animated:NO completion:completion];
}

+ (void)dismissController:(UIViewController *)currentController
             isAllDismiss:(BOOL)isAllDismiss
                 animated:(BOOL)isAnimated
               completion:(void (^ __nullable)(void))completion {
    if (isAllDismiss) {
        while (currentController.presentingViewController) {
            currentController = currentController.presentingViewController;
        }
    }
    [currentController dismissViewControllerAnimated:isAnimated completion:completion];
}

+ (NSMutableDictionary *)SignWithParams:(NSMutableDictionary *)params {
    if (params == nil) {
        params = [[NSMutableDictionary alloc]init];
    }
    [params setValue:[CarSalesConst getInstance].versionCode forKey:@"_ver"];
    return params;
}

@end
