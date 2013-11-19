//
//  AppDelegate.m
//  Start
//
//  Created by 想当当 on 13-10-31.
//  Copyright (c) 2013年 想当当. All rights reserved.
//
#import "UIColor+Hex.h"
#import "AppDelegate.h"
#import "IndexViewController.h"
#import "WelComeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"didFinishLaunchingWithOptions");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor whiteColor];
    //self.window.backgroundColor = [UIColor colorWithHex:0xF9F9F9 alpha:1];
    self.indexView = [[IndexViewController alloc] init];
    //self.window.rootViewController = self.indexView;
    
    self.welcomeView = [[WelComeViewController alloc] init];
    
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:self.welcomeView];
    //self.window.rootViewController = nav;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0){
        NSLog(@">=4.0");
        self.window.rootViewController = nav;
        //self.window.rootViewController = self.welcomeView;
    }else{
        NSLog(@"<4.0");
        [self.window addSubview:nav.view];
        //[self.window addSubview:self.welcomeView.view];
    }
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");
}


@end
