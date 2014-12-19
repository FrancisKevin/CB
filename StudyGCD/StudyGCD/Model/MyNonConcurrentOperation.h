//
//  MyNonConcurrentOperation.h
//  StudyGCD
//
//  Created by xychen on 14-12-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNonConcurrentOperation : NSOperation

@property(strong) id myData;

- (id)initWithData:(id)data;

@end
