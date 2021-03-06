//
//  AppDelegate.m
//  CBExampleAPI
//
//  Created by xychen on 14-6-17.
//  Copyright (c) 2014年 CB. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // ViewController
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"UIKitViewController"];
//    self.vc.title = NSStringFromClass([ViewController class]);
    self.vc.title = @"UIKit";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:self.vc];
    nav1.navigationBar.hidden = YES;
    
    // FirstViewController
    FoundationViewController *firstVC = [[FoundationViewController alloc] initWithNibName:@"FoundationViewController" bundle:nil];
//    firstVC.title = NSStringFromClass([FirstViewController class]);
    firstVC.title = @"Foundation";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:firstVC];
    nav2.navigationBar.hidden = YES;
    
    AVFoundationViewController *secondVC = [[AVFoundationViewController alloc] initWithNibName:@"AVFoundationViewController" bundle:nil];
    secondVC.title = @"AVFoundation";
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:secondVC];
    nav3.navigationBar.hidden = YES;
    
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    tabController.viewControllers = @[nav1, nav2, nav3];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tabController];
    
    self.window.rootViewController = nav;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
