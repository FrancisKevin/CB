//
//  NSString+Util.m
//  Nfse
//
//  Created by xychen on 14-8-11.
//  Copyright (c) 2014年 ct. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

// 时间戳(精确到毫秒数)格式化成NSString
+ (NSString *)formatTimestamp:(long long)timestamp dateFormat:(NSString *)dateFormat
{
    NSTimeInterval timeInterval = timestamp / 1000.0;
    NSString *str = [self formatTimeInterval:timeInterval dateFormat:dateFormat];
    return str;
}

// 时间戳(精确到秒数)格式化成NSString
+ (id)formatTimeInterval:(NSTimeInterval)timeInterval dateFormat:(NSString *)dateFormat
{
    NSDate *aDate = [[NSDate alloc]initWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    NSString *str = [dateFormatter stringFromDate:aDate];
    return str;
}

// NSDate格式化成NSString
+ (id)formatDate:(NSDate *)date dateFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

// 将特定格式的字符串转换成NSDate
- (NSDate *)formatStringWithDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *aDate= [dateFormatter dateFromString:self];
    return aDate;
}

// 计算特定格式的日期字符串到现在的时间间隔。返回年、月……
- (NSDictionary *)dateIntervalSinceNowWithFormat:(NSString *)format
{
    NSCalendar *calendar1 = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;// 该设置意味着日期组件能够显示那些信息。现在设置了年月日，那么这个日期组件就能够获取到年月日的信息。
    NSDate *today = [NSDate date];
    NSDate *toDate = [self formatStringWithDateFormat:format];
    NSDateComponents *comp = [calendar1 components:unitFlags fromDate:toDate toDate:today options:NSCalendarWrapComponents];
    NSInteger spaceYear = [comp year];
    NSInteger spaceMonth = [comp month];
    NSInteger spaceDay = [comp day];
    NSInteger spaceHour = [comp hour];
    NSInteger spaceMinute = [comp minute];
    NSInteger spaceSecond = [comp second];
    
    NSDictionary *dictInterval =
  @{@"year": [NSString stringWithFormat:@"%d", spaceYear],
    @"month": [NSString stringWithFormat:@"%d", spaceMonth],
    @"day": [NSString stringWithFormat:@"%d", spaceDay],
    @"hor": [NSString stringWithFormat:@"%d", spaceHour],
    @"minute": [NSString stringWithFormat:@"%d", spaceMinute],
    @"second": [NSString stringWithFormat:@"%d", spaceSecond]};
    
    return dictInterval;
}

// 验证正则
-(BOOL)validateWithRegular:(NSString *)regular
{
    NSPredicate *specialTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    return [specialTest evaluateWithObject:self];
}



@end
