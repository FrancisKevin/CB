//
//  NSString+Util.h
//  Nfse
//
//  Created by xychen on 14-8-11.
//  Copyright (c) 2014年 ct. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

// 时间戳(精确到毫秒数)格式化成NSString
+ (NSString *)formatTimestamp:(long long)timestamp dateFormat:(NSString *)dateFormat;

// 时间戳(精确到秒数)格式化成NSString
+ (id)formatTimeInterval:(NSTimeInterval)timeInterval dateFormat:(NSString *)dateFormat;

// NSDate格式化成NSString
+ (id)formatDate:(NSDate *)date dateFormat:(NSString *)format;

// 将特定格式的字符串转换成NSDate
- (NSDate *)formatStringWithDateFormat:(NSString *)format;

// 计算特定格式的日期字符串到现在的时间间隔。返回年、月……
- (NSDictionary *)dateIntervalSinceNowWithFormat:(NSString *)format;

// 验证正则
-(BOOL)validateWithRegular:(NSString *)regular;

@end
