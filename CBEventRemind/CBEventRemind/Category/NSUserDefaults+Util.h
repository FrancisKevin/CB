//
//  NSUserDefaults+Util.h
//  CBEventRemind
//
//  Created by xychen on 14-10-16.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KUDDrinkWaterRemind @"DrinkWaterRemind"

@interface NSUserDefaults (Util)

/*!取NSString
 */
+(NSString *)getStringForKey:(NSString *)key;

/*!存NSString
 */
+(void)setStringForKey:(NSString *)key value:(NSString *)value;

/*!取BOOL
 */
+(BOOL)getBoolForKey:(NSString *)key;

/*!存BOOL
 */
+(void)setBoolForKey:(NSString *)key value:(BOOL)value;

/*!通过 remindID 获取开关状态
 */
+(BOOL)getSwitchRemindWithID:(NSString *)remindID;

/*!通过 remindID 存开关状态
 */
+(void)setSwitchRemindWithID:(NSString *)remindID value:(BOOL)value;

@end
