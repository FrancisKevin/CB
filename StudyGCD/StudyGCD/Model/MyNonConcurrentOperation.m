//
//  MyNonConcurrentOperation.m
//  StudyGCD
//
//  Created by xychen on 14-12-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "MyNonConcurrentOperation.h"

@implementation MyNonConcurrentOperation

- (id)initWithData:(id)data
{
    if (self = [super init])
    {
        self.myData = data;
    }
    
    return self;
}

- (void)main
{
    @try
    {
        // Do some work on myData and report the results.
        
        BOOL isDone = NO;
        
        while (![self isCancelled] && !isDone)
        {
            // Do some work and set isDone to YES when finished
        }
    }
    @catch (NSException *exception)
    {
        NSLog(@"%@", exception);
        
        // Do not rethrow exceptions.
    }
    @finally
    {
        
    }
}

@end
