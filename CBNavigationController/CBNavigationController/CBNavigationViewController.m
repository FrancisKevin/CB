//
//  CBNavigationViewController.m
//  CBNavigationController
//
//  Created by VIPMAC on 15/7/13.
//  Copyright (c) 2015年 com.chen. All rights reserved.
//

#import "CBNavigationViewController.h"

@interface CBNavigationViewController ()

@end

@implementation CBNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self customNavigationColor1];
    
//    [self customNavigationColor2];
    
    [self customNavigationTitleFont];
    
//    [self addButtons];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];// 文字和图案设置为白色
}

// 更改导航栏的背景和文字Color,方法一
- (void)customNavigationColor1
{
    //set NavigationBar 背景颜色&title 颜色
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
}

// 更改导航栏的背景和文字Color,方法二
- (void)customNavigationColor2
{
    //设置NavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    //@{}代表Dictionary
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

// 改变导航栏标题的字体
- (void)customNavigationTitleFont
{
    /*
     NSTextAttributeFont - 字体
     NSTextAttributeTextColor - 文字颜色
     NSTextAttributeTextShadowColor - 文字阴影颜色
     NSTextAttributeTextShadowOffset - 偏移用于文本阴影
     */
    
    UIColor *titleColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, -10);
    
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:28.0];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor, NSShadowAttributeName:shadow, NSFontAttributeName:font}];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
}

// 添加多个栏按钮项目
- (void)addButtons
{
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    shareItem.width = 50;
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    NSArray *itemsArr = @[shareItem,cameraItem];
    self.navigationItem.rightBarButtonItems = itemsArr;
}

@end
