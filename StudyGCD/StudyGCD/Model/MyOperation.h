//
//  MyOperation.h
//  StudyGCD
//
//  Created by xychen on 14-12-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyOperation : NSOperation
{
    BOOL _executing;
    BOOL _finished;
}

- (void)completeOperation;

@end
