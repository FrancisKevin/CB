//
//  SuperCommon.m
//  CBExampleAPI
//
//  Created by xychen on 14-7-17.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "SuperCommon.h"

@implementation SuperCommon

+ (void)showAlertTitle:(NSString *)title message:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
