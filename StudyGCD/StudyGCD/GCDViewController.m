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
    NSOperation *_allOp;
    NSOperationQueue *_allOpQueue;
}

@end

@implementation GCDViewController

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
    
    [self.btnBlockExample setTitle:@"简单block例子" forState:UIControlStateNormal];
    [self.btnBlockExample addTarget:self action:@selector(simpleBlockExampleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    /*
     // 获取全局并行调度队列。参数1：优先级，参数2：未来的扩张，目前可传0
     dispatch_queue_t aQueue;
     aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
     
     // 创建串行调度队列
     dispatch_queue_t queue;
     queue = dispatch_queue_create("com.example.MyQueue", NULL);
     
     // 基于块变量如何使用调度任务异步和同步
     dispatch_queue_t myCustomQueue;
     myCustomQueue = dispatch_queue_create("com.example.MyCustomQueue", NULL);
     dispatch_async(myCustomQueue, ^
     {
     printf("1.Do some work here.\n");
     });
     printf("2.The first block may or may not have run.\n");
     dispatch_async(myCustomQueue, ^
     {
     printf("3.Do some work here.\n");
     });
     printf("4.Both blocks have completed.\n");
     */
    
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

- (IBAction)simpleBlockExampleAction:(id)sender
{
    int x = 123;
    int y = 456;
    
    // Block declaration and assignment
    void (^aBlock)(int) = ^(int z)
    {
        printf("%d %d %d\n", x, y, z);
    };
    
    // Execute the block
    aBlock(789);
}

// 完成任务后执行回调
- (IBAction)callbackAfterATask:(id)sender
{
    //    average_async(<#int *data#>, <#size_t len#>, <#dispatch_queue_t queue#>, <#^(int)block#>)
}
/*
void average_async(int *data, size_t len, dispatch_queue_t queue, void (^block)(int))
{
    // Retain the queue provided by the user to make sure it does not disappear before the completion block can be called.
    //    dispatch_retain(queue);// ARC下不需要这句
    
    // Do the work on the default concurrent queue and then call the user-provided block with the results.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
                   {
                       //        int avg = average(data, len);
                       //        dispatch_async(queue, ^{block(avg);});
                       
                       // Release the user-provided queue when done
                       //        dispatch_release(queue);// ARC下不需要这句
                   });
}
*/
#pragma mark - Custom Method
/*
 // 队列清理方法
 void myFinalizerFunction(void *context)
 {
 MyDataContext *theData = (MyDataContext *)context;
 
 // Clean up the contents of the structure
 
 }
 */



@end
