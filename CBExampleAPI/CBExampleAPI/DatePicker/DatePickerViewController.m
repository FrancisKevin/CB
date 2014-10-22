//
//  DatePickerViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-10-22.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDate *nowDate = [NSDate date];
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.minuteInterval = 5;// 分钟间隔
    
    [datePicker setDate:nowDate animated:YES];
    
    [self.view addSubview:datePicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
