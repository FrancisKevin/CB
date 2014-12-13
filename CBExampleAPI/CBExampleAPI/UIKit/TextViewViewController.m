//
//  TextViewViewController.m
//  CBExampleAPI
//
//  Created by chenbing on 14-12-13.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "TextViewViewController.h"

@interface TextViewViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) UITextView *tv;

@end

@implementation TextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tv = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 300, 250)];
    [self.view addSubview:self.tv];
    self.tv.text = @"a\nb\nc\nd\ne\nf\ng\nh\ni\nj\nk\nl\nm\nn\no\np\nq\nr\ns\nt\nu\nv\nw\nx\ny\nz";
    self.tv.editable = NO;
    self.tv.textColor = [UIColor whiteColor];
    self.tv.backgroundColor = [UIColor greenColor];
    // 显示TextView的滚动条
    UIScrollView *sc = self.tv;
    sc.delegate = self;
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(showRightBar) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --视图移动后判断是否是UIImage，然后判断是否是竖滚动条设置让滚动条显示
- (void)showRightBar
{    
    UITextView *tv = self.tv;
    
    [tv setContentOffset:CGPointMake(0, 1) animated:NO];
    for(UIView *img in [tv subviews])
    {
        if ([img isKindOfClass:[UIImageView class]] &&
            img.autoresizingMask == UIViewAutoresizingFlexibleLeftMargin)
        {
            [img setAlpha:1];
        }
    }
}

#pragma mark --滚动视图结束移动后判断是否是UIImage，然后判断是否是竖滚动条设置让滚动条显示--
-(void)scrollViewDidEndDecelerating:(UIScrollView *)sc
{
    for (UIView *img in [sc subviews])
    {
        if ([img isKindOfClass:[UIImageView class]] &&
            img.autoresizingMask == UIViewAutoresizingFlexibleLeftMargin)
        {
            [img setAlpha:1];
        }
    }
}

@end
