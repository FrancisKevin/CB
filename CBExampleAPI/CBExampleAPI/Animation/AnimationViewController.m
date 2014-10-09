//
//  AnimationViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-7-22.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

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
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonAction
- (IBAction)animationAction:(id)sender
{
    /*
     // 基础动画
     [UIView animateWithDuration:1.0 animations:^{
     
     [self setButtonAnimationFrame];
     
     }];
     //*/
    
    /*
    // 带完成块的动画
    [UIView animateWithDuration:1.0 animations:^{
        
        [self setButtonAnimationFrame];
        
    } completion:^(BOOL finished) {
        
        NSLog(@"执行完成块！");
        if (finished)
        {
            [UIView animateWithDuration:1.0 animations:^{
                
                [self setButtonOriginFrame];
                
            }];
        }
        
    }];
    //*/
    
    /*
    // 带延迟启动和动画效果
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        [self setButtonAnimationFrame];
        
    } completion:^(BOOL finished) {
        
        [self setButtonOriginFrame];
        
    }];
    */
    
    
    [UIView transitionWithView:self.btnAnimation duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        [self.btnAnimation setTitle:@"lbl" forState:UIControlStateNormal];
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - CustomMethod
- (void)setButtonOriginFrame
{
    self.btnAnimation.frame = CGRectMake(20, 20, 46, 30);
}

- (void)setButtonAnimationFrame
{
    self.btnAnimation.frame = CGRectMake(250, 300, 46, 30);
}

@end
