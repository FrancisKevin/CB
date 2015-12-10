//
//  UIImage+Utils.m
//  CBExampleAPI
//
//  Created by FrancisKevin on 15/12/10.
//  Copyright © 2015年 CB. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (UIImage *)getScreenshotWithView:(UIView *)screenshotView
{
    UIGraphicsBeginImageContextWithOptions(screenshotView.bounds.size, screenshotView.isOpaque, 0);
    [screenshotView drawViewHierarchyInRect:screenshotView.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
