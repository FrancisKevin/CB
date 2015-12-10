//
//  SecondViewController.m
//  CBExampleAPI
//
//  Created by xychen on 15-1-8.
//  Copyright (c) 2015年 CB. All rights reserved.
//

#import "AVFoundationViewController.h"

@interface AVFoundationViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *arrayFoundation;

@property (strong, nonatomic) UITableView *tbFoundationList;

@end

@implementation AVFoundationViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //    NSLog(@"\n%@\n%@", NSStringFromClass([FirstViewController class]), self.view);
    
    if (!_tbFoundationList)
    {        
        self.arrayFoundation = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AVFoundation.plist" ofType:nil]];
        
        CGFloat originY = 0;
        CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
        CGFloat tabHeight = self.tabBarController.tabBar.frame.size.height;
        CGFloat height = 0;
        if (KIsIOS7)
        {
            //            navHeight = 0;
            originY = navHeight;
            tabHeight = 0;
            height = KAppHeight-navHeight-tabHeight+20;
        }
        else
        {
            height = KAppHeight-originY-navHeight-tabHeight;
        }
        
        _tbFoundationList = [[UITableView alloc] init];
        _tbFoundationList.frame = CGRectMake(0, originY, KAppWidth, height);
        [self.view addSubview:_tbFoundationList];
        
        _tbFoundationList.dataSource = self;
        _tbFoundationList.delegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayFoundation.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = nil;
    
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    NSInteger row = indexPath.row+1;
    NSDictionary *dict = [self.arrayFoundation objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%d.%@", (int)row, [dict objectForKey:@"ClassName"]];
    
    NSNumber *isLevel2 = [dict objectForKey:@"IsLevel2"];
    if ([isLevel2 boolValue])
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger row = indexPath.row+1;
    
    UIViewController *vc;
    
    if (1 == row)
    {
        vc = [self initViewControllerWithName:@"AudioPlayerViewController" title:@"音频播放"];
    }
    
    
    if (vc)
    {
        [self.tabBarController.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Init ViewController
- (UIViewController *)initViewControllerWithName:(NSString *)name title:(NSString *)title
{
    UIViewController *vc = [[NSClassFromString(name) alloc] initWithNibName:name bundle:nil];
    vc.title = title;
    return vc;
}

@end
