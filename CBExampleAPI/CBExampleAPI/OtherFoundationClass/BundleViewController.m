//
//  BundleViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-6-18.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "BundleViewController.h"

@interface BundleViewController ()

@end

@implementation BundleViewController

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
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSLog(@"\n程序路径：%@", bundle);
    
    NSString *path = [bundle resourcePath];
    NSBundle *language = [NSBundle bundleWithPath:path];
    NSLog(@"\n资源路径%@", language);
    
    NSArray *array = [bundle executableArchitectures];
    for (id architecture in array)
    {
        NSString *msg = @"无体系结构";
        if ([architecture intValue] == NSBundleExecutableArchitectureI386)
        {
            msg = @"英特尔32位处理器";
        }
        else if ([architecture intValue] == NSBundleExecutableArchitecturePPC)
        {
            msg = @"PowerPC处理器";
        }
        else if ([architecture intValue] == NSBundleExecutableArchitectureX86_64)
        {
            msg = @"64位的AMD处理器";
        }
        else if ([architecture intValue] == NSBundleExecutableArchitecturePPC64)
        {
            msg = @"64位的PowerPC处理器";
        }
        
        NSLog(@"\n%@", msg);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
