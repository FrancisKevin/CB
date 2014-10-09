//
//  ArrayViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-6-17.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "ArrayViewController.h"

@interface ArrayViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *arrayAPI;

@property (strong, nonatomic) UITableView *tbAPIList;

@end

@implementation ArrayViewController

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
    
    if (!_tbAPIList)
    {
        self.arrayAPI = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ArrayAPI.plist" ofType:nil]];
        
        CGFloat originY = 0;
        CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
        CGFloat tabHeight = self.tabBarController.tabBar.frame.size.height;
        CGFloat height = 0;
        if (KIsIOS7)
        {
            navHeight = 0;
            tabHeight = 0;
            height = 20;
        }
        
        _tbAPIList = [[UITableView alloc] init];
        _tbAPIList.frame = CGRectMake(0, originY, KAppWidth, KAppHeight-originY-navHeight-tabHeight+height);
        [self.view addSubview:_tbAPIList];
        
        _tbAPIList.dataSource = self;
        _tbAPIList.delegate = self;
    }
    
//    [self printObjects:@"First Object", @"Second Object", @"Third Object", @"Fourth Object", @"Fifth Object", nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayAPI.count;
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
    NSDictionary *dict = [self.arrayAPI objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%d.%@", row, [dict objectForKey:@"Title"]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger row = indexPath.row+1;
    
    NSArray *arr = [self getArray];
    
    if (1 == row)
    {
        [self printObjects:@"First Object", @"Second Object", @"Third Object", @"Fourth Object", @"Fifth Object", nil];
    }
    else if (2 == row)
    {
        [self getStringFromArray:arr withSeparator:@", "];
    }
    else if (3 == row)
    {
        [self forwardForeachArray:arr];
    }
    else if (4 == row)
    {
        [self sortedArrayHint:arr];
    }
    else if (5 == row)
    {
        [self sortedArrayUsingFunction:arr];
    }
    else if (6 == row)
    {
        [self sortedArrayUsingFunction2:arr];
    }
    else if (7 == row)
    {
        [self subarrayWithRange:arr];
    }
}

#pragma mark - API Example
- (NSArray *)getArray
{
    NSArray *array = [self printObjects:@"First Object", @"Second Object", @"Third Object", @"Fourth Object", @"Fifth Object", nil];
    
    return array;
}

// 传入多个对象
- (NSArray *)printObjects:(NSString *)firstObj, ... NS_REQUIRES_NIL_TERMINATION
{
    NSString *eachObject;// 数据类型依据传入的数据类型来定义。如 NSString 可以换做 id 等
    va_list argumentList;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    if (firstObj)// 因为 firstObj 不在 va_list 中，所以需要特殊处理
    {
        [array addObject:firstObj];
        
        va_start(argumentList, firstObj);// 开始扫描 firstObj 后面的参数
        while ((eachObject = va_arg(argumentList, id)))
        {
            [array addObject:eachObject];
        }
        va_end(argumentList);
    }
    
    NSLog(@"\nArray:%@", array);
    
    return array;
}

// 数组转换为字符串，用分隔符分开数组元素
- (void)getStringFromArray:(NSArray *)array withSeparator:(NSString *)separator
{
    NSString *str = [array componentsJoinedByString:separator];
    NSLog(@"\nArray:\n%@\nString:%@", array, str);
}

// 从后向前遍历数组
- (void)forwardForeachArray:(NSArray *)array
{
    NSEnumerator *enu = [array reverseObjectEnumerator];
    id obj;
    while ((obj = enu.nextObject))
    {
        NSLog(@"%@", obj);
    }
}

// 数组排序
- (NSData *)sortedArrayHint:(NSArray *)array
{
    NSData *data = [array sortedArrayHint];
    NSLog(@"\ndata:%@", data);
    return data;
}

// 字母、字符串排序
- (void)sortedArrayUsingFunction:(NSArray *)array
{
    NSArray *newArray = [array sortedArrayUsingFunction:sortFirstLetter context:NULL];
    NSLog(@"\nOrigin:%@\nNew:%@", array, newArray);
}

// 字母排序 A-Z
NSInteger sortFirstLetter(id obj1, id obj2, void *context)
{
    /*
    // 按首字母
    NSString *letter1 = (NSString *)obj1;
    letter1 = [letter1 substringToIndex:1];
    
    NSString *letter2 = (NSString *)obj2;
    letter2 = [letter2 substringToIndex:1];
    
    NSComparisonResult result = [letter1 localizedCompare:letter2];
    return result;
    */
    // 按字符串
    NSString *letter1 = (NSString *)obj1;
    NSString *letter2 = (NSString *)obj2;
    
    NSComparisonResult result = [letter1 localizedCompare:letter2];
    return result;
}

// 字母、字符串排序2
- (void)sortedArrayUsingFunction2:(NSArray *)array
{
    NSData *data = [self sortedArrayHint:array];
    NSArray *newArray = [array sortedArrayUsingFunction:sortFirstLetter context:nil hint:data];
    NSLog(@"\nOrigin:%@\nNew:%@", array, newArray);
}

// 截取数组
- (void)subarrayWithRange:(NSArray *)array
{
    NSUInteger loc = 1;
    NSUInteger len = 3;
    NSArray *newArray = [array subarrayWithRange:NSMakeRange(loc, len)];
    NSLog(@"\nOrigin:%@\n从索引第%d位截取%d个元素:%@", array, loc, len, newArray);
}

@end
