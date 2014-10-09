//
//  CBProgressBar.h
//  CBProgressBar
//
//  Created by xychen on 14-2-24.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBProgressBar : UIView

+ (void)showProgressAddedTo:(UIView *)view text:(NSString *)text;
+ (void)showProgressAddedTo:(UIView *)view;
+ (void)hideProgressForView:(UIView *)view;

@end
