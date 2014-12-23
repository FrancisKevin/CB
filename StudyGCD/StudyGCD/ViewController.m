//
//  ViewController.m
//  StudyGCD
//
//  Created by xychen on 14-12-18.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "ViewController.h"

#import "GCDViewController.h"
#import "ThreadViewController.h"
#import "OperationViewController.h"

@interface ViewController ()
{
    
}

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.btnGCD setTitle:@"GCD相关内容" forState:UIControlStateNormal];
    [self.btnGCD addTarget:self action:@selector(GCDContentAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnThread setTitle:@"NSThread相关内容" forState:UIControlStateNormal];
    [self.btnThread addTarget:self action:@selector(threadContentAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnOperation setTitle:@"NSOperation相关内容" forState:UIControlStateNormal];
    [self.btnOperation addTarget:self action:@selector(operationAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ButtonAction
- (IBAction)GCDContentAction:(id)sender
{
    GCDViewController *gcdVC = [[GCDViewController alloc] initWithNibName:@"GCDViewController" bundle:nil];
    [self presentViewController:gcdVC animated:YES completion:nil];
}

- (IBAction)threadContentAction:(id)sender
{
    ThreadViewController *threadVC = [[ThreadViewController alloc] initWithNibName:@"ThreadViewController" bundle:nil];
    [self presentViewController:threadVC animated:YES completion:nil];
}

- (IBAction)operationAction:(id)sender
{
    OperationViewController *opVC = [[OperationViewController alloc] initWithNibName:@"OperationViewController" bundle:nil];
    [self presentViewController:opVC animated:YES completion:nil];
}

@end
