//
//  CarSalesConst.m
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import "CarSalesConst.h"

@implementation CarSalesConst

static CarSalesConst *instance;
+(instancetype)getInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CarSalesConst alloc]init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _isDebug = NO;
        _isEnterLoginPage = YES;
        _hostName = @"https://dcms.thedream.cc";
        _companyName = @"骏梦";
        _isShowLogo = YES;
        
        _versionCode = @"1.0.0";

        _maxCount = 3;
        _timerSum = 60;
        _httpRequestTimeCount = 15;
        _showToastTimeCount = 3.0;
        _minimumPressDuration = 1.5;
        _showAuthViewTimeCount = 2.5;
        _showToastMaxWidth = 200;

        _APIGameInitPath = @"sdk/init";
        _APIGameRegisterCheckUserPath = @"sdk/user/register/checkuser";
        _APIGameAccountRegisterPath = @"sdk/user/register/uid";
        _APIGamePhoneCodePath = @"sdk/user/register/cell/getcode";
        _APIGamePhoneRegisterCodeConfirmPath = @"sdk/user/register/cell/verifycode";
        _APIGamePhoneRegisterPath = @"sdk/user/register/cell";
        _APIGameLoginTicketPath = @"sdk/user/login/getticket";
        _APIGameLoginPath = @"sdk/user/login/uid";
        _APIGameOneClickLoginCellPath = @"sdk/user/login/cell/oneclick/validatetoken";
        _APIGameOneClickRegisterPath = @"sdk/user/login/cell/oneclick/register";
        _APIGameGuestLoginPath = @"sdk/user/register/guest";
        _APIGameAuthLoginPath = @"sdk/user/login/auto";
        _APIGameWeChatLoginPath = @"sdk/user/login/wx";
        _APIGameWeChatAuthCodeLoginPath = @"sdk/user/login/wx/scan/sign";
        _APIGameAppleLoginPath = @"sdk/user/login/apple";
        _APIGameRealNamePath = @"sdk/v2/user/usid/set";
        _APIGameGetBindPhoneCodePath = @"sdk/user/bind/cell/getcode";
        _APIGameBindPhoneCodeConfirmPath = @"sdk/user/bind/cell";
        _APIGameCheckBindPhonePath = @"sdk/user/upw/reset/checkbind";
        _APIGameGetPhoneCodePath = @"sdk/user/upw/reset/getcode";
        _APIGameFindPwdCodeConfirmPath = @"sdk/user/upw/reset/verifycode";
        _APIGameResetPwdPath = @"sdk/user/upw/reset";
        _APIGameAppStoreOrderPath = @"sdk/pay/order/create/appstore";
        _APIGameAppStoreCallBackPath = @"sdk/pay/order/callback/appstore";
        _APIGameGetTokenDataPath = @"sdk/token";
        _APIGameGetH5List = @"sdk/h5/entry/list";
        
        _APIGameDataReceivePath = @"sdk/dss/data/receive";
    }
    return self;
}

@end
