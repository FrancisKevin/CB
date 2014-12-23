//
//  GCDViewController.m
//  StudyGCD
//
//  Created by xychen on 14-12-22.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()
{
    
}

@end

@implementation GCDViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_queue_t queue;
    queue = dispatch_get_main_queue();// 获取串行调度队列
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
