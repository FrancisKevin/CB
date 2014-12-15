//
//  GestureRecognizerViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-12-15.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "GestureRecognizerViewController.h"

@interface GestureRecognizerViewController ()

@end

@implementation GestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 加入单击手势
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapLabel:)];
    self.lbl.userInteractionEnabled = YES;
    [self.lbl addGestureRecognizer:singleTapGesture];

    singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapImageView:)];
    self.iv.userInteractionEnabled = YES;
    [self.iv addGestureRecognizer:singleTapGesture];
    
    singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapView:)];
    self.aView.userInteractionEnabled = YES;
    [self.aView addGestureRecognizer:singleTapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)singleTapLabel:(UIGestureRecognizer*)gestureRecognizer
{
    NSString *msg = @"没获取到点击视图";
    if ([[gestureRecognizer view] isKindOfClass:[UILabel class]])
    {
        msg = @"您点击了UILabel";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)singleTapImageView:(UIGestureRecognizer*)gestureRecognizer
{
    NSString *msg = @"没获取到点击视图";
    if ([[gestureRecognizer view] isKindOfClass:[UIImageView class]])
    {
        msg = @"您点击了UIImageView";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)singleTapView:(UIGestureRecognizer*)gestureRecognizer
{
    NSString *msg = @"没获取到点击视图";
    if ([[gestureRecognizer view] isKindOfClass:[UIView class]])
    {
        msg = @"您点击了UIView";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
