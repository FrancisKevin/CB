//
//  MyOperation.m
//  StudyGCD
//
//  Created by xychen on 14-12-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "MyOperation.h"


@implementation MyOperation

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _executing = NO;
        _finished = NO;
    }
    
    return self;
}

- (BOOL)isConcurrent
{
    return YES;
}

- (BOOL)isExecuting
{
    return _executing;
}

- (BOOL)isFinished
{
    return _finished;
}

- (void)start
{
    // Always check for cancellation before launching the task.
    if ([self isCancelled])
    {
        // Must move the operation to the finished state if it is canceled.
        [self willChangeValueForKey:@"isFinished"];
        _finished = YES;
        [self didChangeValueForKey:@"isfinished"];
        return;
    }
    
    // If the operation is not canceled, begin executing the task.
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    _executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main
{
    @try {
        // Do the main work of the operation here.
        
        [self completeOperation];
    }
    @catch (NSException *exception) {
        // Do not rethrow exceptions
    }
    @finally {
        
    }
}

- (void)completeOperation
{
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    _executing = NO;
    _finished = YES;
    
    [self didChangeValueForKey:@"isFinished"];
    [self didChangeValueForKey:@"isExecuting"];
}

// 手动执行一个操作对象
- (BOOL)performOperation:(NSOperation *)anOp
{
    BOOL ranIt = NO;
    
    if ([anOp isReady] && ![anOp isCancelled])
    {
        if (![anOp isConcurrent])
        {
            [anOp start];
        }
        else
        {
            [NSThread detachNewThreadSelector:@selector(start) toTarget:anOp withObject:nil];
        }
        
        ranIt = YES;
    }
    else if ([anOp isCancelled])
    {
        // If it was canceled before it was started, move the operation to the finished state.
        [self willChangeValueForKey:@"isFinished"];
        [self willChangeValueForKey:@"isExecuting"];
        
        _executing = NO;
        _finished = YES;
        
        [self didChangeValueForKey:@"isFinished"];
        [self didChangeValueForKey:@"isExecuting"];
        
        // Set ranIt to YES to prevent the operation from being passed to this method again in the future.
        ranIt = YES;
    }
    
    return ranIt;
}

@end
