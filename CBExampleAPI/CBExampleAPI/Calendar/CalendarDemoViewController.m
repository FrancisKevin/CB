//
//  CalendarDemoViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-6-27.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CalendarDemoViewController.h"

@interface CalendarDemoViewController ()

@end

@implementation CalendarDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSCalendar *calendar3 = [[NSCalendar alloc] initWithCalendarIdentifier:NSBuddhistCalendar];// 佛教日历
    NSString *identifier = [calendar3 calendarIdentifier];
    NSLog(@"日历标识符：%@", identifier);
    
    NSCalendar *calendar1 = [NSCalendar currentCalendar];
    [calendar1 setLocale:[NSLocale currentLocale]];
    NSLog(@"日历地区信息：%@", [calendar1 locale]);
    
    
    [calendar1 setTimeZone:[NSTimeZone systemTimeZone]];
    NSLog(@"日历时区信息：%@", [calendar1 timeZone]);
    
    
    [calendar1 setFirstWeekday:3];// 周日：1 …… 周六：7
    NSLog(@"每周第一天是：%lu", (unsigned long)[calendar1 firstWeekday]);
    
    
    [self setCalendar:calendar1 minimumDaysInFirstWeek:5];
    
    
    [self logCalendarLocaleSysmbols:calendar1];// 改方法不可用，ios系统禁用了
    
    
    NSRange minRange = [calendar1 minimumRangeOfUnit:NSDayCalendarUnit];
    NSRange maxRange = [calendar1 maximumRangeOfUnit:NSDayCalendarUnit];
    NSLog(@"\nminRange:%@\nmaxRange%@", NSStringFromRange(minRange), NSStringFromRange(maxRange));
    
    
    NSRange range1 = [calendar1 rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSLog(@"\n今天所在月份包含的日期范围是：%@", NSStringFromRange(range1));
    
    
    NSUInteger num1 = [calendar1 ordinalityOfUnit:NSCalendarUnitWeekdayOrdinal inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSLog(@"\n今天是这个月的第%lu周", (unsigned long)num1);
    
    
    NSDate *sDate;
    NSTimeInterval timeSpace;
    BOOL canCalculate = [calendar1 rangeOfUnit:NSCalendarUnitMonth startDate:&sDate interval:&timeSpace forDate:[NSDate date]];
    NSString *hint = canCalculate? @"计算成功" : @"计算失败";
    NSLog(@"\n%@!今天所在月的第一天是%@，这个月有%.0f秒，即%.0f天", hint, sDate, timeSpace, (timeSpace/3600/24));
    
    
    NSDateComponents *comp = [[NSDateComponents alloc] init];
    [comp setYear:2008];
    [comp setMonth:8];
    [comp setDay:8];
    [comp setHour:16];
    [comp setMinute:8];
    [comp setSecond:8];
    NSDate *dateFromComp = [calendar1 dateFromComponents:comp];
    NSLog(@"\n通过NSDateComponents获得NSDate:%@", dateFromComp);
    
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;// 该设置意味着日期组件能够显示那些信息。现在设置了年月日，那么这个日期组件就能够获取到年月日的信息。
    comp = [calendar1 components:unitFlags fromDate:dateFromComp];
    NSLog(@"\n通过NSDate获得NSDateComponents:%@", [comp description]);
    
    
    comp = [[NSDateComponents alloc] init];
    NSInteger addDay = 10;
    [comp setDay:addDay];
    NSDate *today = [NSDate date];
    NSDate *dateAdd = [calendar1 dateByAddingComponents:comp toDate:today options:NSCalendarWrapComponents];
    NSLog(@"\n现在是：%@\n%d天后是：%@", today, addDay, dateAdd);
    
    
    unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;// 该设置意味着日期组件能够显示那些信息。现在设置了年月日，那么这个日期组件就能够获取到年月日的信息。
    NSDate *toDate = [today dateByAddingTimeInterval:-(3600*24*480)];
    comp = [calendar1 components:unitFlags fromDate:today toDate:toDate options:NSCalendarWrapComponents];
    NSInteger yearSpace = [comp year];
    NSInteger monthSpace = [comp month];
    NSInteger daySpace = [comp day];
    NSLog(@"\n从%@到%@，相差%d年%d个月%d天", today, toDate, yearSpace, monthSpace, daySpace);
    
    
    //其他的API是10.9/IOS7可用，所以暂时不列举出来
    NSString *aStr = @"- (void)getEra:(out NSInteger *)eraValuePointer year:(out NSInteger *)yearValuePointer month:(out NSInteger *)monthValuePointer day:(out NSInteger *)dayValuePointer fromDate:(NSDate *)date";
    NSLog(@"\n\n\n其他的API是10.9/IOS7可用，所以暂时不列举出来。\n如%@", aStr);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Calendar Setting
- (void)logCalendarLocaleSysmbols:(NSCalendar *)calendar
{
//    NSLog(@"\neraSymbols%@", [calendar eraSymbols]);
}

- (void)setCalendar:(NSCalendar *)calendar minimumDaysInFirstWeek:(NSUInteger)minimum
{
    [calendar setMinimumDaysInFirstWeek:minimum];// 设置每年及每月第一周必须包含的最少天数，比如：设定第一周最少包括3天，则value传入3
    NSLog(@"每年及每月第一周必须包含的最少天数是：%lu", (unsigned long)[calendar minimumDaysInFirstWeek]);
    
    /*
     当方法[NSCalendar ordinalityOfUnit: inUnit: fromDate:]
     的ordinalityOfUnit参数为NSWeekCalendarUnit，inUnit参数为NSYearCalendarUnit时，
     minimumDaysInFirstWeek属性影响它的返回值。具体说明如下:
     
     2005年1月
     日   一   二   三   四   五   六
     --------------------------------
     1
     2    3    4    5    6    7    8
     9   10   11   12   13   14   15
     16   17   18   19   20   21   22
     23   24   25   26   27   28   29
     30   31
     
     2005年1月第一周包括1号。
     a. 如果将minimumDaysInFirstWeek设定 = 1
     则fromDate传入1月1号，方法均返回1  ==> 满足minimumDaysInFirstWeek指定的天数(最少1天)，所以方法将其归为2005年的第1周
     则fromDate传入1月2-8号，方法均返回2
     则fromDate传入1月9-15号，方法均返回3
     ......
     
     b. 如果将minimumDaysInFirstWeek设定为 > 1，比如2
     则fromDate传入1月1号，方法均返回53  ==> 不足2天，所以方法将其归为2004年的第53周
     则fromDate传入1月2-8号，方法均返回1
     则fromDate传入1月9-15号，方法均返回2
     ......
     
     
     2008年1月
     日   一   二   三   四   五   六
     ---------------------------------
     1    2    3    4    5
     6    7    8    9   10   11   12
     13   14   15   16   17   18   19
     20   21   22   23   24   25   26
     27   28   29   30   31
     
     2005年1月第一周包括1-5号共5天。
     a. 如果将minimumDaysInFirstWeek设定为 <= 5时
     则fromDate传入1月1-5号，方法均返回1  ==> 满足minimumDaysInFirstWeek指定的天数，所以方法将其归为2008年的第1周
     则fromDate传入1月6-12号，方法均返回2
     则fromDate传入1月13-19号，方法均返回3
     ......
     b. 如果将minimumDaysInFirstWeek设定为 > 5，比如6
     则fromDate传入1月1-5号，方法均返回53  ==> 当周不足6天，所以方法将其归为2007年的第53周
     则fromDate传入1月2-8号，方法均返回1
     则fromDate传入1月9-15号，方法均返回2
     ......
     当方法[NSCalendar ordinalityOfUnit: inUnit: fromDate:]
     的ordinalityOfUnit参数为NSWeekCalendarUnit，inUnit参数为NSMonthCalendarUnit时，
     minimumDaysInFirstWeek属性影响它的返回值。以2008年4月为例， 具体说明如下:
     
     2008年4月
     日   一   二   三   四   五   六
     ---------------------------------
     1    2    3    4    5
     6    7    8    9   10   11   12
     13   14   15   16   17   18   19
     20   21   22   23   24   25   26
     27   28   29   30
     
     
     2008年4月第一周包括1、2、3、4、5号。
     1. 如果将minimumDaysInFirstWeek设定为小于或等于5的数
     则fromDate传入4月1-5号，方法均返回1
     则fromDate传入4月6-12号，方法均返回2
     则fromDate传入4月13-19号，方法均返回3
     ....
     2. 如果将minimumDaysInFirstWeek设定为大于5的数
     则fromDate传入1-5号，方法均返回0
     则fromDate传入6-12号，方法均返回1
     则fromDate传入13-19号，方法均返回2
     ....
     */
}

@end
