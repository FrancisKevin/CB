//
//  SuperViewController.m
//  StudyGCD
//
//  Created by xychen on 14-12-22.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()
{
    UIButton *_btnBack;
}

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!_btnBack)
    {
        _btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnBack.frame = CGRectMake(0, CGRectGetHeight(self.view.frame)-40, 80, 40);
        [_btnBack setTitle:@"返回" forState:UIControlStateNormal];
        [_btnBack setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnBack addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btnBack];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonAction
- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
