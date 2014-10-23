//
//  CustomRemindViewController.m
//  CBEventRemind
//
//  Created by xychen on 14-10-23.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "CustomRemindViewController.h"

@interface CustomRemindViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tbList;
    NSMutableArray *_arrList;
    UIDatePicker *_datePicker;
    
//    UITableViewCell *_focusCell;
    NSIndexPath *_selectIndexPath;
}

@end

@implementation CustomRemindViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _arrList = [[NSMutableArray alloc] init];
    [_arrList addObject:@"12:00:00"];
    
    [self initBarButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!_tbList)
    {
        CGFloat tbY = CGRectGetMaxY(_segRepeat.frame) + 10;
        CGRect tbRect = CGRectMake(0, tbY, KScreenWidth, KScreenheight-tbY);
        _tbList = [[UITableView alloc] initWithFrame:tbRect];
        _tbList.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tbList.dataSource = self;
        _tbList.delegate = self;
        [self.view addSubview:_tbList];
        
        [_tbList reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - InitUI
-(void)initBarButton
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    rightBtn.frame = CGRectMake(20, 10, 40, 30);
    [rightBtn addTarget:self action:@selector(addTimeAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}

#pragma mark - UITableViewDataSource
// 分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrList.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"timeCell";
    
    UITableViewCell *cell = [_tbList dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] ;
    }
    
    NSString *time = @"";
    if (_arrList.count > indexPath.row)
    {
        time = [_arrList objectAtIndex:indexPath.row];
    }
    else
        // 如果是最后一行
    {
        time = @"添加一个时间";
    }
    
    cell.textLabel.text = time;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tfEvent resignFirstResponder];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    _focusCell = [tableView cellForRowAtIndexPath:indexPath];
    _selectIndexPath = indexPath;
    
    if (_arrList.count == indexPath.row)
        // 如果是最后一行
    {
        /*
        if (!_datePicker)
        {
            _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame), 0, 0)];
            _datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
            _datePicker.timeZone = [NSTimeZone systemTimeZone];
            _datePicker.countDownDuration = 86399;// 23:59
            _datePicker.minuteInterval = 1;// 分钟选项的间隔,每1分钟一个选项行
            _datePicker.date = [NSDate date];
            _datePicker.backgroundColor = [UIColor whiteColor];
        }
        [self.view insertSubview:_datePicker aboveSubview:_tbList];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect rect = _datePicker.frame;
            rect.origin.y -= CGRectGetHeight(rect);
            _datePicker.frame = rect;
        }];
        
        
        // 添加一个背景按钮，用来关闭选择器
        UIButton *btnClosePicker = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat btnY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
        btnClosePicker.frame = CGRectMake(0, btnY, KScreenWidth, KScreenheight);
        btnClosePicker.backgroundColor = [UIColor grayColor];
        btnClosePicker.alpha = 0.8;
        [btnClosePicker addTarget:self action:@selector(closePickerAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view insertSubview:btnClosePicker belowSubview:_datePicker];
        */
    }
    else
    {
        if (!_datePicker)
        {
            _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame), 0, 0)];
            _datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
            _datePicker.timeZone = [NSTimeZone systemTimeZone];
            _datePicker.countDownDuration = 86399;// 23:59
            _datePicker.minuteInterval = 1;// 分钟选项的间隔,每1分钟一个选项行
            _datePicker.date = [@"12:00:00" formatStringWithDateFormat:@"HH:mm:ss"];
            _datePicker.backgroundColor = [UIColor whiteColor];
        }
        [self.view insertSubview:_datePicker aboveSubview:_tbList];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            CGRect rect = _datePicker.frame;
            rect.origin.y -= CGRectGetHeight(rect);
            _datePicker.frame = rect;
        }];
        
        
        // 添加一个背景按钮，用来关闭选择器
        UIButton *btnClosePicker = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat btnY = CGRectGetMaxY(self.navigationController.navigationBar.frame);
        btnClosePicker.frame = CGRectMake(0, btnY, KScreenWidth, KScreenheight);
        btnClosePicker.backgroundColor = [UIColor grayColor];
        btnClosePicker.alpha = 0.8;
        btnClosePicker.tag = 153508;
        [btnClosePicker addTarget:self action:@selector(closePickerAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view insertSubview:btnClosePicker belowSubview:_datePicker];
    }
}

#pragma mark - ButtonAction
- (IBAction)addTimeAction:(id)sender
{
    [self closePickerAction:[self.view viewWithTag:153508]];
    
    if (![_tfEvent.text isEqualToString:@""])
    {
        NSLog(@"时间点：%@", _arrList);
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请完善信息" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)closePickerAction:(id)sender
{
    // 修改选中行的时间
    NSString *time = [NSString formatDate:_datePicker.date dateFormat:@"HH:mm:ss"];
    [_arrList replaceObjectAtIndex:_selectIndexPath.row withObject:time];
    [_tbList reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGRect rect = _datePicker.frame;
        rect.origin.y = CGRectGetHeight(self.view.frame);
        _datePicker.frame = rect;
        
    } completion:^(BOOL finished) {
        
        if (finished)
        {
            [_datePicker removeFromSuperview];
        }
    }];
    
    
    UIButton *btn = (UIButton *)sender;
    [btn removeFromSuperview];
    
    [_tfEvent resignFirstResponder];
}

@end
