//
//  RemindDrinkingViewController.h
//  CBEventRemind
//
//  Created by xychen on 14-10-16.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "SuperViewController.h"

@interface RemindDrinkingViewController : SuperViewController

@property (strong, nonatomic) NSDictionary *remindDict;

@property (strong, nonatomic) IBOutlet UILabel *lblDrink;
@property (strong, nonatomic) IBOutlet UISwitch *swi;

- (IBAction)switchDrink:(id)sender;

@end
