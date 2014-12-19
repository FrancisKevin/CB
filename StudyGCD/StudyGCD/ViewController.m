//
//  ViewController.m
//  StudyGCD
//
//  Created by xychen on 14-12-18.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSOperation *_allOp;
    NSOperationQueue *_allOpQueue;
}

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _allOp = [[NSOperation alloc] init];
    _allOpQueue = [[NSOperationQueue alloc] init];
    
    [self.btnStart setTitle:@"开始" forState:UIControlStateNormal];
    [self.btnStart addTarget:self action:@selector(startOperationAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnInvocation setTitle:@"创建Invocation" forState:UIControlStateNormal];
    [self.btnInvocation addTarget:self action:@selector(createNSInvocationOperationAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnBlock setTitle:@"创建Block" forState:UIControlStateNormal];
    [self.btnBlock addTarget:self action:@selector(createNSBlockOperationAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // NSOperation NSInvocationOperation NSBlockOperation
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ButtonAction
- (IBAction)createNSInvocationOperationAction:(id)sender
{
    NSLog(@"创建一个NSInvocationOperation对象");
    
    [_allOp addDependency:[self taskWithData:@"A NSString Object"]];
    
    [_allOpQueue addOperation:[self taskWithData:@"A NSString Object"]];// Add a single operation.
    /*
    [_allOpQueue addOperations:anArrayOfOps waitUntilFinished:NO];// Add multiple operations
    
    [_allOpQueue addOperationWithBlock:^
    {
        // Do something.
    }];
     */
}

- (NSOperation *)taskWithData:(id)data
{
    NSInvocationOperation *theOp = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(myTaskMethod:) object:data];
    
    return theOp;
}

// This is the method that does the actual work of the task.
- (void)myTaskMethod:(id)data
{
    // peroform the task
    NSLog(@"这是一个%@数据", NSStringFromClass([data class]));
}

- (IBAction)createNSBlockOperationAction:(id)sender
{
    NSLog(@"创建一个NSBlockOpertion对象");
    
    NSBlockOperation *theOp = [NSBlockOperation blockOperationWithBlock:^
                               {
                                   NSLog(@"Beginning operation.\n");
                                   // Do some work.
                               }];
    
    [_allOp addDependency:theOp];
    
    [_allOpQueue addOperationWithBlock:^
    {
        NSLog(@"Beginning operation.\n");
        // Do some work.
    }];
}

- (IBAction)startOperationAction:(id)sender
{
    if (_allOp.executing)
    {
        
    }
    else
    {
        //        [_allOp start];
    }
}

@end
