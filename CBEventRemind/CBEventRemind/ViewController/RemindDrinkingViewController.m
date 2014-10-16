//
//  RemindDrinkingViewController.m
//  CBEventRemind
//
//  Created by xychen on 14-10-16.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "RemindDrinkingViewController.h"

@interface RemindDrinkingViewController ()

@end

@implementation RemindDrinkingViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.swi setOn:NO animated:YES];
    [self switchDrink:self.swi];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonAction
- (IBAction)switchDrink:(id)sender
{
    UISwitch *swi = (UISwitch *)sender;
    if (swi.on)
    {
        self.lblDrink.textColor = [UIColor blackColor];
        
        [self addDrinkForEverydayRemind];
    }
    else
    {
        self.lblDrink.textColor = [UIColor grayColor];
        
        [self cancelAllNotification];
    }
    
    [self checkAllNotification];
}

- (void)addDrinkForEverydayRemind
{
    NSArray *arrayTime = [[NSArray alloc] initWithObjects:@"08:00:00", @"09:00:00", @"11:10:00", @"13:50:00", @"15:10:00", @"17:10:00", @"19:30:00", @"21:15:00",nil];
    
//    NSArray *arrayTime = [[NSArray alloc] initWithObjects:@"14:33:30", @"14:33:33", @"14:33:36", @"14:33:39", @"14:33:42", @"14:33:45", @"14:33:48", @"14:33:51",nil];
    
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
        [self addLocalNotificationWithDate:remindDateTime repeat:NSCalendarUnitDay planId:@"1" dict:[[NSDictionary alloc] init]];
    }
}

// 添加本地通知
- (void)addLocalNotificationWithDate:(NSDate *)remindDate repeat:(NSCalendarUnit)repeatInterval planId:(NSString *)planId dict:(NSDictionary *)dict
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
        //            localNotification.repeatCalendar =
        
        // 提示内容
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSString *dateStr = [formatter stringFromDate:remindDate];
        NSString *alertBody = [NSString stringWithFormat:@"喝水时间到了~\n现在是%@。", dateStr];
        localNotification.alertBody = alertBody;
        
        // 是否有弹出AlertView
        localNotification.hasAction = YES;
        //            localNotification.alertAction = @"查看";// AlertView的按钮文字
        
        // 提示声音
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        // 角标气泡数量
        /*
         NSArray *arrayScheduled = [UIApplication sharedApplication].scheduledLocalNotifications;
         localNotification.applicationIconBadgeNumber = arrayScheduled.count + 1;
         */
        localNotification.applicationIconBadgeNumber = 1;
        /*
        // 设置 UserInfo 为本地通知做标记
        NSNumber *value = [NSNumber numberWithBool:YES];
        NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:value, KClockRemindKey, planId, KClockRemindPlanId, dict, KClockRemindDict, nil];
        localNotification.userInfo = userInfo;
        */
        // 加入日程本地通知
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
        //        NSLog(@"%@  %@", localNotification.alertBody, localNotification.fireDate);
    }
}

// 取消所有日程提醒
- (void)cancelAllNotification
{
    NSArray *arraySchedule = [UIApplication sharedApplication].scheduledLocalNotifications;
    for (UILocalNotification *ln in arraySchedule)
    {
        //        NSLog(@"\n\n提醒通知：%@\n移除：%@  %@", [ln description], ln.alertBody, ln.fireDate);
        [[UIApplication sharedApplication] cancelLocalNotification:ln];
    }
}

// 查看所有日程
- (void)checkAllNotification
{
    NSLog(@"\n-----显示当前日程-----");
    
    NSArray *arraySchedule = [UIApplication sharedApplication].scheduledLocalNotifications;
    for (UILocalNotification *ln in arraySchedule)
    {
        NSLog(@"\n\n提醒通知：%@\n：%@  %@", [ln description], ln.alertBody, ln.fireDate);
    }
}

@end
