//
//  EventRemind.m
//  CBEventRemind
//
//  Created by xychen on 14-10-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "EventRemind.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define KNotificationRemindID @"NotificationRemindID"

@implementation EventRemind

/*! 取消所有日程提醒
 */
+ (void)cancelAllNotification
{
    NSArray *arraySchedule = [UIApplication sharedApplication].scheduledLocalNotifications;
    for (UILocalNotification *ln in arraySchedule)
    {
        //        NSLog(@"\n\n提醒通知：%@\n移除：%@  %@", [ln description], ln.alertBody, ln.fireDate);
        [[UIApplication sharedApplication] cancelLocalNotification:ln];
    }
}

/*! 取消对应日程提醒
 */
+ (void)cancelNotificationWithID:(NSString *)remindID
{
    NSArray *arraySchedule = [UIApplication sharedApplication].scheduledLocalNotifications;
    for (UILocalNotification *ln in arraySchedule)
    {
        //        NSLog(@"\n\n提醒通知：%@\n移除：%@  %@", [ln description], ln.alertBody, ln.fireDate);
        NSString *value = [ln.userInfo objectForKey:KNotificationRemindID];
        if ([remindID isEqualToString:value])
        {
            [[UIApplication sharedApplication] cancelLocalNotification:ln];
        }
    }
}

/*! 查看所有日程
 */
+ (void)checkNotificationWithID:(NSString *)remindID
{
    NSLog(@"\n-----显示当前日程-----");
    
    NSArray *arraySchedule = [UIApplication sharedApplication].scheduledLocalNotifications;
    for (UILocalNotification *ln in arraySchedule)
    {
        NSString *value = [ln.userInfo objectForKey:KNotificationRemindID];
        if ([remindID isEqualToString:value])
        {
            NSLog(@"\n\n提醒通知：%@\n：%@  %@", [ln description], ln.alertBody, ln.fireDate);
        }
    }
}

/*! 添加提醒，设置ID、时间点数组（格式HH:mm:ss）、重复模式（不重复：0）、userInfo(可传nil)
 */
+ (void)addEverydayRemindWithID:(NSString *)remindID arrayTime:(NSArray *)arrayTime repeat:(NSCalendarUnit)repeat userInfo:(NSDictionary *)userInfo
{
    [self cancelNotificationWithID:remindID];
    
    for (NSString *timeItem in arrayTime)
    {
        // 当前日期时间
        NSDate *nowDateTime = [NSDate date];
        
        // 需要的日期时间
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateStr = [formatter stringFromDate:nowDateTime];
        dateStr = [NSString stringWithFormat:@"%@ %@", dateStr, timeItem];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *remindDateTime= [formatter dateFromString:dateStr];
        
        // 添加提醒
        [self addNotificationWithID:remindID date:remindDateTime repeat:repeat userInfo:userInfo];
    }
}

/*! 添加一条本地通知
 */
+ (void)addNotificationWithID:(NSString *)remindID date:(NSDate *)remindDate repeat:(NSCalendarUnit)repeatInterval userInfo:(NSDictionary *)userInfo
{
    // 本地通知提醒
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    if (localNotification)
    {
        // 通知触发时间
        localNotification.fireDate = remindDate;
        
        // 手机默认时区
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        // 重复时间，0表示不重复 //NSWeekCalendarUnit一周提示一次
        localNotification.repeatInterval = repeatInterval;
        
        // 提示内容
        NSString *hint = [userInfo objectForKey:@"hint"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSString *dateStr = [formatter stringFromDate:remindDate];
        NSString *alertBody = [NSString stringWithFormat:@"%@\n现在是%@。", hint, dateStr];
        localNotification.alertBody = alertBody;
        
        // 是否有弹出AlertView
        localNotification.hasAction = YES;
        
        // 提示声音
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        // 角标气泡数量
        localNotification.applicationIconBadgeNumber = 1;
        
        // 设置 UserInfo 为本地通知做标记
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:remindID forKey:KNotificationRemindID];
        [dict addEntriesFromDictionary:userInfo];
        localNotification.userInfo = dict;
        
        // 加入日程本地通知
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

@end
