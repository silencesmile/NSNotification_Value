//
//  SecondViewController.m
//  521Travel_block_Value
//
//  Created by youngstar on 16/12/7.
//  Copyright © 2016年 521Travel.com. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic, strong) UITextField *textField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"Second";
    
    self.textField = [[UITextField alloc]initWithFrame:(CGRectMake(100, 200, 150, 30))];
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.placeholder = @"在这里输入";
    [self.view addSubview:_textField];
    
    [self leftBack];
}

- (void)leftBack
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:(UIBarButtonItemStylePlain) target:self action:@selector(back:)];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void)back:(UIButton *)button
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    NSDictionary *tempDic = [NSDictionary dictionaryWithObject:_textField.text forKey:@"textField"];
    
    // 创建一个通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    // 发送通知. 其中的Name填写第一界面的Name， 系统知道是第一界面来相应通知， object就是要传的值,nil表示可以是任何类型的值。 UserInfo是一个字典， 如果要用的话，提前定义一个字典， 可以通过这个来实现多个参数的传值使用。
    
    [center postNotificationName:@"UIField" object:nil userInfo:tempDic];
    
}


@end
