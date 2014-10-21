//
//  EverydayRemindViewController.h
//  CBEventRemind
//
//  Created by xychen on 14-10-20.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "SuperViewController.h"

@interface EverydayRemindViewController : SuperViewController

@property (strong, nonatomic) NSDictionary *remindDict;

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UISwitch *swi;


@end
