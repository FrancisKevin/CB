//
//  AutoresizingMaskViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-12-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "AutoresizingMaskViewController.h"

@interface AutoresizingMaskViewController ()
{
    UIView *_sView;
    UIImageView *_iv;
}


@end

@implementation AutoresizingMaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImage *img = [UIImage imageNamed:@"taobao@2x.PNG"];
    _iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 500)];
    _iv.image = img;
    // 设置子视图自适应
    _iv.contentMode = UIViewContentModeScaleAspectFit;
    _iv.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleHeight  | UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleBottomMargin;
    
    _sView = [[UIView alloc] initWithFrame:CGRectMake(0, 108, CGRectGetWidth(_iv.frame), CGRectGetHeight(_iv.frame))];
    [self.view addSubview:_sView];
    
    [_sView addSubview:_iv];
    
    [self.view bringSubviewToFront:self.viewTool];
    
    self.tfWid.text = [NSString stringWithFormat:@"%.0f", CGRectGetWidth(_sView.frame)];
    self.tfHeight.text = [NSString stringWithFormat:@"%.0f", CGRectGetHeight(_sView.frame)];
    
    [self.btnReset addTarget:self action:@selector(resetScrollAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetScrollAction:(id)sender
{
    CGFloat wid = [self.tfWid.text floatValue];
    CGFloat height = [self.tfHeight.text floatValue];
    CGRect viewRect = _sView.frame;
    viewRect.size.width = wid;
    viewRect.size.height = height;
    _sView.frame = viewRect;
}

@end
