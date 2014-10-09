//
//  DateFormatterViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-7-2.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "DateFormatterViewController.h"

@interface DateFormatterViewController ()

@end

@implementation DateFormatterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-M-d h:m:s";
    NSString *dateStr = [formatter stringFromDate:nowDate];
    NSLog(@"\n%@按照\n%@格式化后，得到\n%@", nowDate, formatter.dateFormat, dateStr);
    
    dateStr = @"2008/8/8 16:8:08";
    formatter.dateFormat = @"yyyy/M/d HH:m:ss";
    NSDate *newDate = [formatter dateFromString:dateStr];
    NSLog(@"\n%@按照\n%@格式化后，得到\n%@", dateStr, formatter.dateFormat, newDate);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
