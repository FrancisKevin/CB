//
//  CBExampleAPI.h
//  CBExampleAPI
//
//  Created by xychen on 14-6-17.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#ifndef CBExampleAPI_CBExampleAPI_h
#define CBExampleAPI_CBExampleAPI_h

#pragma mark - 手机屏幕尺寸（坐标点）
#define KScreenSize [UIScreen mainScreen].bounds.size
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#pragma mark - 应用程序尺寸

#define KAppSize [UIScreen mainScreen].applicationFrame.size
#define KAppWidth [UIScreen mainScreen].applicationFrame.size.width
#define KAppHeight [UIScreen mainScreen].applicationFrame.size.height

#pragma mark - 系统信息

#define KIsIOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7.0

#pragma mark - 加入头文件
#import "SuperCommon.h"

#endif
