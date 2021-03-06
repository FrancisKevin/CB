//
//  ViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-6-17.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "UIKitViewController.h"

#import "UIImage+Utils.h"

#import "ImageController.h"

@interface UIKitViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *arrayUIKit;

@property (strong, nonatomic) UITableView *tbUIKitList;

@end

@implementation UIKitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"加载了%@", NSStringFromClass([UIKitViewController class]));
    
    NSLog(@"执行[%@ %@]", NSStringFromClass([UIKitViewController class]), NSStringFromSelector(_cmd));
    
    if (!_tbUIKitList)
    {
        self.arrayUIKit = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UIKitFramework.plist" ofType:nil]];
        
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
        
        _tbUIKitList = [[UITableView alloc] init];
        _tbUIKitList.frame = CGRectMake(0, originY, KAppWidth, height);
        [self.view addSubview:_tbUIKitList];
        
        _tbUIKitList.dataSource = self;
        _tbUIKitList.delegate = self;
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
    return self.arrayUIKit.count;
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
    NSDictionary *dict = [self.arrayUIKit objectAtIndex:indexPath.row];
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
        vc = [self initViewControllerWithName:@"ActivityIndicatorViewController" title:@"指示器"];
    }
    else if (2 == row)
    {
        vc = [self initViewControllerWithName:@"AnimationViewController" title:@"视图动画"];
    }
    else if (3 == row)
    {
        vc = [self initViewControllerWithName:@"DatePickerViewController" title:@"日期选择器"];
    }
    else if (4 == row)
    {
        vc = [self initViewControllerWithName:@"TextViewViewController" title:@"多行文本框"];
    }
    else if (5 == row)
    {
        vc = [self initViewControllerWithName:@"GestureRecognizerViewController" title:@"点击手势"];
    }
    else if (6 == row)
    {
        vc = [self initViewControllerWithName:@"AutoresizingMaskViewController" title:@"子视图自适应父视图size"];
    }
    else if (7 == row)
    {
        UIImage *image = [UIImage getScreenshotWithView:self.view];
        ImageController *imgVC = [ImageController imageController];
        imgVC.title = @"截取View生成图片";
        imgVC.imgScreenshot = image;
        vc = imgVC;
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
