//
//  DataViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-7-2.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

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
    
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"ScheduleTypeCustom.png" ofType:nil];
    NSData *imgData = [NSData dataWithContentsOfFile:imgPath];
    NSLog(@"数据长度：%ul", imgData.length);
    
    Byte *testByte = (Byte *)[imgData bytes];
    for(int i=0;i<[imgData length];i++)
    {
//        NSLog(@"testByte = %d", testByte[i]);
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
