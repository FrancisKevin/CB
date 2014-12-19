//
//  AutoresizingMaskViewController.h
//  CBExampleAPI
//
//  Created by xychen on 14-12-19.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoresizingMaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *viewTool;
@property (strong, nonatomic) IBOutlet UITextField *tfWid;
@property (strong, nonatomic) IBOutlet UITextField *tfHeight;
@property (strong, nonatomic) IBOutlet UIButton *btnReset;
@end
