//
//  CarSalesConst.h
//  CarSales
//
//  Created by 谢吴军 on 2021/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarSalesConst : NSObject

@property (assign, nonatomic) BOOL isDebug; // 是否是调试环境
@property (assign, nonatomic) BOOL isEnterLoginPage; // 是否进入登录页面
@property (strong, nonatomic) NSString *hostName; // url
@property (strong, nonatomic) NSString *companyName; // 公司名称
@property (assign, nonatomic) BOOL isShowLogo; // 是否需要显示logo
@property (readonly, strong, nonatomic) NSString *versionCode; // 版本号
@property (readonly, assign, nonatomic) NSInteger maxCount;     // 最大历史下拉框
@property (readonly, assign, nonatomic) NSInteger timerSum;     // 验证码倒计时
@property (readonly, assign, nonatomic) NSInteger httpRequestTimeCount;     // 网络请求最大时间
@property (readonly, assign, nonatomic) CGFloat showToastTimeCount;  // 弹窗时间
@property (readonly, assign, nonatomic) CGFloat minimumPressDuration;  // 最小按压时间
@property (readonly, assign, nonatomic) CGFloat showAuthViewTimeCount; // 自动登录时间
@property (readonly, assign, nonatomic) NSInteger showToastMaxWidth;  // 弹窗最大宽度

///！！！接口Path - 一般不能改变！！！
// 业务path - start
@property (readonly, strong, nonatomic) NSString *APIGameInitPath; // 初始化
@property (readonly, strong, nonatomic) NSString *APIGameRegisterCheckUserPath;  // 注册检查用户名是否存在
@property (readonly, strong, nonatomic) NSString *APIGameAccountRegisterPath;  // 普通账号注册
@property (readonly, strong, nonatomic) NSString *APIGamePhoneCodePath;  // 注册获取手机验证码
@property (readonly, strong, nonatomic) NSString *APIGamePhoneRegisterCodeConfirmPath;  // 验证手机登录验证码
@property (readonly, strong, nonatomic) NSString *APIGamePhoneRegisterPath; // 手机注册
@property (readonly, strong, nonatomic) NSString *APIGameLoginTicketPath; // 获取登录凭证
@property (readonly, strong, nonatomic) NSString *APIGameLoginPath; // 登录
@property (readonly, strong, nonatomic) NSString *APIGameOneClickLoginCellPath; // 一键登录验证token
@property (readonly, strong, nonatomic) NSString *APIGameOneClickRegisterPath; // 一键登录新用户注册
@property (readonly, strong, nonatomic) NSString *APIGameGuestLoginPath; // 游客登录
@property (readonly, strong, nonatomic) NSString *APIGameAuthLoginPath; // 自动登录
@property (readonly, strong, nonatomic) NSString *APIGameWeChatLoginPath; // 微信登录
@property (readonly, strong, nonatomic) NSString *APIGameWeChatAuthCodeLoginPath; // 微信扫码登录
@property (readonly, strong, nonatomic) NSString *APIGameAppleLoginPath; // 苹果登录
@property (readonly, strong, nonatomic) NSString *APIGameRealNamePath; // 实名认证
@property (readonly, strong, nonatomic) NSString *APIGameGetBindPhoneCodePath; // 绑定手机发送验证码
@property (readonly, strong, nonatomic) NSString *APIGameBindPhoneCodeConfirmPath;  // 验证绑定手机验证码
@property (readonly, strong, nonatomic) NSString *APIGameCheckBindPhonePath;  // 检查账号是否绑定手机号
@property (readonly, strong, nonatomic) NSString *APIGameGetPhoneCodePath;  // 找回密码获取手机验证码
@property (readonly, strong, nonatomic) NSString *APIGameFindPwdCodeConfirmPath; // 验证找回密码验证码
@property (readonly, strong, nonatomic) NSString *APIGameResetPwdPath;  // 重置密码
@property (readonly, strong, nonatomic) NSString *APIGameAppStoreOrderPath;  // 苹果下单
@property (readonly, strong, nonatomic) NSString *APIGameAppStoreCallBackPath;  // 苹果回调
@property (readonly, strong, nonatomic) NSString *APIGameGetTokenDataPath;  // 获取SDK_TOKE接口
@property (readonly, strong, nonatomic) NSString *APIGameGetH5List;  // 获取H5列表功能接口
// 业务path - end

// 数据path - start
@property (readonly, strong, nonatomic) NSString *APIGameDataReceivePath;  // 数据上传
// 数据path - end

+(instancetype)getInstance;

@end

NS_ASSUME_NONNULL_END
