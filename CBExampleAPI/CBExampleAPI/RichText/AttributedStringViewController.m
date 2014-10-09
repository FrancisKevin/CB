//
//  AttributedStringViewController.m
//  CBExampleAPI
//
//  Created by xychen on 14-6-18.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "AttributedStringViewController.h"

@interface AttributedStringViewController ()

@end

@implementation AttributedStringViewController

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
    
    [self textColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Custom Method
// 设置文本的颜色，字体大小，背景色，
- (void)textColor
{
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"One Two Three\n Four Five"];
    
    NSDictionary *dictOne = [[NSDictionary alloc] initWithObjectsAndKeys:
                             [UIColor redColor], NSForegroundColorAttributeName,// 颜色
                             [UIFont systemFontOfSize:14], NSFontAttributeName,// 字体
                             [UIColor greenColor], NSBackgroundColorAttributeName,// 背景色
                             @(1), NSLigatureAttributeName,
                             @(1), NSStrikethroughStyleAttributeName,// 删除线
                             @(1), NSUnderlineStyleAttributeName,// 下划线
                             nil];
    [att addAttributes:dictOne range:NSMakeRange(0, 3)];
    
    NSDictionary *dictTwo = [[NSDictionary alloc] initWithObjectsAndKeys:
                             [UIColor greenColor], NSForegroundColorAttributeName,
                             [UIFont systemFontOfSize:18], NSFontAttributeName,
                             [UIColor blueColor], NSBackgroundColorAttributeName,
                             @(0), NSLigatureAttributeName,
                             nil];
    [att addAttributes:dictTwo range:NSMakeRange(4, 3)];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 40;
    NSDictionary *dictThree = [[NSDictionary alloc] initWithObjectsAndKeys:
                               [UIColor blueColor], NSForegroundColorAttributeName,
                               [UIFont systemFontOfSize:22], NSFontAttributeName,
                               paragraph, NSParagraphStyleAttributeName, nil];
    [att addAttributes:dictThree range:NSMakeRange(8, 5)];
    
    NSDictionary *dictFour = [[NSDictionary alloc] initWithObjectsAndKeys:
                              [UIColor cyanColor], NSForegroundColorAttributeName,
                              [UIFont systemFontOfSize:26], NSFontAttributeName,
                              [UIColor yellowColor], NSBackgroundColorAttributeName, nil];
    [att addAttributes:dictFour range:NSMakeRange(15, 4)];
    
    NSDictionary *dictFive = [[NSDictionary alloc] initWithObjectsAndKeys:
                              [UIColor yellowColor], NSForegroundColorAttributeName,
                              [UIFont systemFontOfSize:30], NSFontAttributeName,
                              [UIColor redColor], NSBackgroundColorAttributeName, nil];
    [att addAttributes:dictFive range:NSMakeRange(20, 4)];
    
    self.lbl1.attributedText = att;
    self.lbl1.backgroundColor = [UIColor blackColor];
}

@end
