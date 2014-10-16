//
//  NSUserDefaults+Util.m
//  CBEventRemind
//
//  Created by xychen on 14-10-16.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "NSUserDefaults+Util.h"

@implementation NSUserDefaults (Util)

/*!取NSString
 */
+(NSString *)getStringForKey:(NSString *)key
{
    NSString *value = nil;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (ud)
    {
        value = [ud stringForKey:key];
    }
    
    if (value && value.length > 0)
    {
        return value;
    }
    else
    {
        return @"";
    }
}

/*!存NSString
 */
+(void)setStringForKey:(NSString *)key value:(NSString *)value
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (ud)
    {
        if (value && value.length > 0)
        {
            [ud setObject:value forKey:key];
            [ud synchronize];
        }
    }
}

/*!取BOOL
 */
+(BOOL)getBoolForKey:(NSString *)key
{
    BOOL value = NO;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (ud)
    {
        value = [ud boolForKey:key];
    }
    
    return value;
}

/*!存BOOL
 */
+(void)setBoolForKey:(NSString *)key value:(BOOL)value
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (ud)
    {
        if (value)
        {
            [ud setBool:YES forKey:key];
        }
        else
        {
            [ud setBool:NO forKey:key];
        }
        [ud synchronize];
    }
}

@end
