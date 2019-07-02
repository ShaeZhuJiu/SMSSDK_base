//
//  ViewController.m
//  SMSSDK
//
//  Created by 谢鑫 on 2019/7/1.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "ViewController.h"
#import "SMS_SDK/SMSSDK.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *codeNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//提示弹窗格式
//UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:errorMsg preferredStyle:UIAlertControllerStyleAlert];
//[alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
// 弹出对话框
//[self presentViewController:alert animated:true completion:nil];
//获取验证码
- (IBAction)clickGetSMS:(UIButton *)sender {
    NSString *phoneNUmber=self.phoneNumber.text;
    [SMSSDK getVerificationCodeByMethod: SMSGetCodeMethodSMS phoneNumber:phoneNUmber zone:@"86" template:nil result:^(NSError *error) {
        if (error==nil) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"发送验证码成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:true completion:nil];
        }else{
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"发送验证码失败" message:[NSString stringWithFormat:@"%@",[error.userInfo objectForKey:@"description"]] preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:true completion:nil];
        }
       
    }];
}
//验证验证码
- (IBAction)clickedVerifyButton:(UIButton *)sender {
    NSString *codeNumber=self.codeNumber.text;
    NSString *phoneNUmber=self.phoneNumber.text;
    [SMSSDK commitVerificationCode:codeNumber phoneNumber:phoneNUmber zone:@"86" result:^(NSError *error) {
        if (error==nil) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"验证成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:true completion:nil];
        }else{
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"验证失败" message:[NSString stringWithFormat:@"%@",[error.userInfo objectForKey:@"description"]] preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:true completion:nil];
        }
    }];
}



@end
