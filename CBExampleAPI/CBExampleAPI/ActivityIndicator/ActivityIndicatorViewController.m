//
//  ActivityIndicatorViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-7-17.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "ActivityIndicatorViewController.h"

@interface ActivityIndicatorViewController ()
{
    UIActivityIndicatorView *_activityIndicatorView;
}

@end

@implementation ActivityIndicatorViewController

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
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 100);
    [_activityIndicatorView startAnimating];
    [self.view addSubview:_activityIndicatorView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)whiteLargeAction:(id)sender
{
    _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.view.backgroundColor = [UIColor blackColor];
}

- (IBAction)whiteAction:(id)sender
{
    _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    self.view.backgroundColor = [UIColor blackColor];
}

- (IBAction)gradeAction:(id)sender
{
    _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.view.backgroundColor = [UIColor whiteColor];
}
@end
