//
//  ViewController.m
//  521Travel_Delete
//
//  Created by youngstar on 16/12/7.
//  Copyright © 2016年 521Travel.com. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () 
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [[UILabel alloc]initWithFrame:(CGRectMake(50, 50, 200, 30))];
    _label.text = @"显示内容";
    [self.view addSubview:_label];
    
    //获取通知中心
    NSNotificationCenter * center =[NSNotificationCenter defaultCenter];
    
    //添加观察者 Observer表示观察者  reciveNotice:表示接收到的消息  name表示再通知中心注册的通知名  object表示可以相应的对象 为nil的话表示所有对象都可以相应
    [center addObserver:self selector:@selector(reciveNotice:) name:@"UIField" object:nil];
    
    
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(100, 200, 100, 30);
    [button setTitle:@"NEXT" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [self.view addSubview:button];
}

- (void)reciveNotice:(NSNotification *)notification{
    
    NSLog(@"收到消息啦!!!");
    
    self.label.text=[notification.userInfo objectForKey:@"textField"];
}


- (void)buttonAction:(UIButton *)button
{
    SecondViewController *second = [[SecondViewController alloc]init];
    UINavigationController *secondNC = [[UINavigationController alloc]initWithRootViewController:second];
    [self presentViewController:secondNC animated:YES completion:nil];
}

// 第一界面中dealloc中移除监听的事件
- (void)dealloc
{
    // 移除当前对象监听的事件
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
