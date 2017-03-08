//
//  ViewController.m
//  iconfont的使用
//
//  Created by 宇玄丶 on 2017/3/8.
//  Copyright © 2017年 北京116工作室. All rights reserved.
//

#import "ViewController.h"
#import "TBCityIconFont.h"
#import "UIImage+TBCityIconFont.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[ UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e619",22,[UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1])] style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonAction)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e603",25, [UIColor colorWithRed:0.14 green:0.61 blue:0.83 alpha:1.00])] style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonAction)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0.14 green:0.61 blue:0.83 alpha:1.00];
    
    
    // imageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 50, 30, 30)];
    [self.view addSubview:imageView];
    imageView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e600", 30, [UIColor redColor])];
    // button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 40, 40);
    [self.view addSubview:button];
    [button setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e612", 40, [UIColor redColor])] forState:UIControlStateNormal];
    [button setTintColor:[UIColor greenColor]];
    // label,label可以将文字与图标结合一起，直接用label的text属性将图标显示出来
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 160, 280, 40)];
    [self.view addSubview:label];
    label.font = [UIFont fontWithName:@"iconfont" size:15];//设置label的字体
    label.text = @"这是用label显示的iconfont  \U0000e617";
    
}

-(void)leftButtonAction{
    
}
-(void)rightButtonAction{
    
}


@end
