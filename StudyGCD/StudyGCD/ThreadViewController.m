//
//  ThreadViewController.m
//  StudyGCD
//
//  Created by xychen on 14-12-22.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self.btnThread1 setTitle:@"开启线程1" forState:UIControlStateNormal];
    [self.btnThread1 addTarget:self action:@selector(createThread1Action:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnThread2 setTitle:@"开启线程2" forState:UIControlStateNormal];
    [self.btnThread2 addTarget:self action:@selector(createThread2Action:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btnLoopObserver setTitle:@"创建运行循环观察者" forState:UIControlStateNormal];
    [self.btnLoopObserver addTarget:self action:@selector(createLoopObserverAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonAction
- (IBAction)createThread1Action:(id)sender
{
    // 开启一个线程
    [NSThread detachNewThreadSelector:@selector(myThreadMainMethod:) toTarget:self withObject:@"obj"];
    
    // 获取当前线程，并使用该线程执行 @selector(myThreadMainMethod2:)
    NSThread *currentThread = [NSThread currentThread];
    [self performSelector:@selector(myThreadMainMethod2:) onThread:currentThread withObject:@"obj2" waitUntilDone:NO];
    
    // 取消一个线程
    int count1 = 0;
    while (nil != (currentThread = [NSThread currentThread])  && count1<15)
    {
        NSLog(@"取消当前线程");
        [currentThread cancel];
        
        count1++;
    }
}

- (IBAction)createThread2Action:(id)sender
{
    // 开启一个线程
    NSThread *aThread;
    aThread = [[NSThread alloc] initWithTarget:self selector:@selector(myThreadMainMethod3:) object:@"obj"];
    [aThread start];
    
    // 取消一个线程
    int count2 = 0;
    while (aThread.executing && count2<15)
    {
        count2++;
    }
    NSLog(@"取消当前线程");
    [aThread cancel];
}

- (IBAction)createLoopObserverAction:(id)sender
{
    
}



#pragma mark - Custom Method
- (void)myThreadMainMethod:(id)obj
{
//    NSString *str = (NSString *)obj;
    NSLog(@"线程调用了%@, 传来对象%@", NSStringFromSelector(_cmd), obj);
    
    int add = 0;
    for (int i = 0; i < 5000; i++)
    {
        if (0 == i%2)
        {
            add += i;
        }
        else
        {
            add += i*2;
        }
        NSLog(@"%@:add = %d", NSStringFromSelector(_cmd), add);
    }
    NSLog(@"%@最终计算结果：%d", NSStringFromSelector(_cmd), add);
}

- (void)myThreadMainMethod2:(id)obj
{
    NSLog(@"线程调用了%@, 传来对象%@", NSStringFromSelector(_cmd), obj);
}

- (void)myThreadMainMethod3:(id)obj
{
    //    NSString *str = (NSString *)obj;
    NSLog(@"线程调用了%@, 传来对象%@", NSStringFromSelector(_cmd), obj);
    
    int add = 5000;
    for (int i = 0; i < 5000; i++)
    {
        if (0 == i%2)
        {
            add -= 1;
        }
        else
        {
            add -= 1;
        }
        NSLog(@"%@:add = %d", NSStringFromSelector(_cmd), add);
    }
    NSLog(@"%@最终计算结果：%d", NSStringFromSelector(_cmd), add);
}



@end
