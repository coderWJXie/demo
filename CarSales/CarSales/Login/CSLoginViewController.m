//
//  CSLoginViewController.m
//  CarSales
//
//  Created by 谢吴军 on 2022/3/9.
//

#import "CSLoginViewController.h"

@interface CSLoginViewController () <
UITextFieldDelegate
>

@property (strong, nonatomic) UITextField *userName_tf;
@property (strong, nonatomic) UITextField *password_tf;

@end

@implementation CSLoginViewController

- (UITextField *)userName_tf {
    if (_userName_tf == nil) {
        _userName_tf = [[UITextField alloc]init];
        _userName_tf.font = [UIFont systemFontOfSize:17];
        _userName_tf.textColor = UIColor.grayColor;
        _userName_tf.textAlignment = NSTextAlignmentLeft;
        _userName_tf.placeholder = @"用户名(邮箱/手机号码)";
        _userName_tf.borderStyle = UITextBorderStyleNone;
        _userName_tf.adjustsFontSizeToFitWidth = true;
        _userName_tf.clearsOnBeginEditing = true;
        _userName_tf.clearButtonMode = UITextFieldViewModeAlways;
        _userName_tf.keyboardAppearance = UIKeyboardAppearanceDark;
        _userName_tf.returnKeyType = UIReturnKeyDone;
        _userName_tf.delegate = self;
//        [_userName_tf addTarget:self action:@selector(userNameEventValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _userName_tf;
}

- (UITextField *)password_tf {
    if (_password_tf == nil) {
        _password_tf = [[UITextField alloc]init];
        _password_tf.font = [UIFont systemFontOfSize:17];
        _password_tf.textColor = UIColor.grayColor;
        _password_tf.textAlignment = NSTextAlignmentLeft;
        _password_tf.placeholder = @"密码";
        _password_tf.borderStyle = UITextBorderStyleBezel;
        _password_tf.adjustsFontSizeToFitWidth = true;
        _password_tf.clearsOnBeginEditing = true;
        _password_tf.clearButtonMode = UITextFieldViewModeAlways;
        _password_tf.keyboardAppearance = UIKeyboardAppearanceDark;
        _password_tf.returnKeyType = UIReturnKeyDone;
        _password_tf.secureTextEntry = true;
        _password_tf.delegate = self;
//        [_password_tf addTarget:self action:@selector(editDidChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _password_tf;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}

-(void)setUpUI {
    [self.view addSubview:self.userName_tf];
    [self.view addSubview:self.password_tf];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == self.userName_tf) {
        [self.password_tf becomeFirstResponder];
    }
    return YES;
}

@end
