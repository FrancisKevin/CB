//
//  EventRemind.h
//  CBEventRemind
//
//  Created by xychen on 14-10-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventRemind : NSObject

/*! 取消所有日程提醒
 */
+ (void)cancelAllNotification;

/*! 取消对应日程提醒
 */
+ (void)cancelNotificationWithID:(NSString *)remindID;

/*! 查看所有日程
 */
+ (void)checkNotificationWithID:(NSString *)remindID;

/*! 添加提醒，设置ID、时间点数组（格式HH:mm:ss）、重复模式（不重复：0）、userInfo(可传nil)
 */
+ (void)addEverydayRemindWithID:(NSString *)remindID arrayTime:(NSArray *)arrayTime repeat:(NSCalendarUnit)repeat userInfo:(NSDictionary *)userInfo;



@end
