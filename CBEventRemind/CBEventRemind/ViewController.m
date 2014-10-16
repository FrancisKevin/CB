//
//  ViewController.m
//  CBEventRemind
//
//  Created by xychen on 14-10-15.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "ViewController.h"

#import "RemindDrinkingViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tbList;
    NSArray *_arrList;
}

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"爱提醒";
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DrinkWater" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    NSError *error = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    _arrList = [[NSArray alloc] initWithArray:jsonArray];
    
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!_tbList)
    {
        CGRect tbRect = CGRectMake(0, 20, KScreenWidth, KScreenheight-20);
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
- (void)initUI
{
    
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
    static NSString *cellIdentifier = @"remindCell";
    
    UITableViewCell *cell = [_tbList dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] ;
    }
    
//    cell.textLabel.text=[[self.arForTable objectAtIndex:indexPath.row] valueForKey:@"Name"];
//    NSString *totalNum=[NSString stringWithFormat:@"共%@题",[[self.arForTable objectAtIndex:indexPath.row] valueForKey:@"Total"]];
//    cell.detailTextLabel.text=totalNum;
    
    NSDictionary *dict = [_arrList objectAtIndex:indexPath.row];
    NSString *content = [dict objectForKey:@"content"];
    cell.textLabel.text = content;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.row)
    {
        RemindDrinkingViewController *vc = [[RemindDrinkingViewController alloc] initWithNibName:@"RemindDrinkingViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (_arrList.count-1 == indexPath.row)
    {
        
    }
    
}

@end
