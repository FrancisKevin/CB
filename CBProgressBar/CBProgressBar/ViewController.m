//
//  ViewController.m
//  CBProgressBar
//
//  Created by xychen on 14-2-24.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "ViewController.h"

#import "CBProgressBar.h"

@interface ViewController ()
{
    UIView *_viewMain;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _viewMain = [[UIView alloc] initWithFrame:CGRectMake(0, 70, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-70)];
    _viewMain.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_viewMain];
    //*
    UIButton *btnShow = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnShow.frame = CGRectMake(40, 40, 60, 30);
    [btnShow setTitle:@"显示" forState:UIControlStateNormal];
    [btnShow addTarget:self action:@selector(showProgressAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShow];
    
    UIButton *btnHide = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnHide.frame = CGRectMake(120, 40, 60, 30);
    [btnHide setTitle:@"隐藏" forState:UIControlStateNormal];
    [btnHide addTarget:self action:@selector(hideProgressAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnHide];
     //*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showProgressAction:(id)sender
{
//    [CBProgressBar showProgressAddedTo:_viewMain];
    [CBProgressBar showProgressAddedTo:_viewMain text:@"正在加载,请稍等..."];
//    [CBProgressBar showProgressAddedTo:_viewMain text:@"等..."];
}

- (IBAction)hideProgressAction:(id)sender
{
    [CBProgressBar hideProgressForView:_viewMain];
}

@end
