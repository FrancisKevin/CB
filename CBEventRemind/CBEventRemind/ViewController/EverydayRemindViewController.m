//
//  EverydayRemindViewController.m
//  CBEventRemind
//
//  Created by xychen on 14-10-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "EverydayRemindViewController.h"

@interface EverydayRemindViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tbList;
    NSArray *_arrList;
}

@end

@implementation EverydayRemindViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!_tbList)
    {
        CGFloat tbY = CGRectGetMaxY(self.lblTitle.frame)+10;
        CGRect tbRect = CGRectMake(0, tbY, KScreenWidth, KScreenheight-tbY);
        _tbList = [[UITableView alloc] initWithFrame:tbRect];
        _tbList.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tbList.dataSource = self;
        _tbList.delegate = self;
        [self.view addSubview:_tbList];
        
        [self switchClick:self.swi];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - InitUI
- (void)initUI
{
    NSString *title = [self.remindDict objectForKey:@"content"];
    self.lblTitle.text = title;
    
    NSString *remindID = [self.remindDict objectForKey:@"remindID"];
    [self.swi setOn:[NSUserDefaults getSwitchRemindWithID:remindID] animated:YES];
    [self setLabelDrink:self.swi.on];
    [self.swi addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setLabelDrink:(BOOL)isOn
{
    if (isOn)
    {
        self.lblTitle.textColor = [UIColor blackColor];
    }
    else
    {
        self.lblTitle.textColor = [UIColor grayColor];
    }
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
    return _arrList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"remindTimeCell";
    
    UITableViewCell *cell = [_tbList dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] ;
    }
    
    NSString *content = [_arrList objectAtIndex:indexPath.row];
    cell.textLabel.text = content;
    
    return cell;
}

#pragma mark - ButtonAction
- (IBAction)switchClick:(id)sender
{
    NSString *remindID = [self.remindDict objectForKey:@"remindID"];
    
    UISwitch *swi = (UISwitch *)sender;
    if (swi.on)
    {
        NSArray *arrayTime = [self.remindDict objectForKey:@"fire_time"];
        _arrList = [[NSArray alloc] initWithArray:arrayTime];
        _tbList.hidden = NO;
        [_tbList reloadData];
        
//        [self addDrinkForEverydayRemind:arrayTime];
        [EventRemind addEverydayRemindWithID:remindID arrayTime:arrayTime repeat:NSCalendarUnitDay userInfo:self.remindDict];
    }
    else
    {
        _arrList = [[NSArray alloc] init];
        _tbList.hidden = YES;
        [_tbList reloadData];
        
//        [self cancelAllNotification];
        [EventRemind cancelNotificationWithID:remindID];
    }
    
    
    [NSUserDefaults setSwitchRemindWithID:remindID value:swi.on];// 保存开关状态
    
    [self setLabelDrink:swi.on];
    
//    [self checkAllNotification];
    [EventRemind checkNotificationWithID:remindID];
}

@end
