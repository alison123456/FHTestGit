//
//  AppDelegate.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/13.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "AppDelegate.h"
#import "GudieCollectionViewController.h"
#import "gudieViewController.h"
#import "hDisplayView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
      [_window makeKeyAndVisible];
    if( ![[NSUserDefaults standardUserDefaults]objectForKey:@"firstLaunch"]){
     //第一次启动
//        GudieCollectionViewController *hvc = [[GudieCollectionViewController alloc] init];
//        self.window.rootViewController = hvc;
//        hDisplayView *hvc = [[hDisplayView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//         [self.window.rootViewController.view addSubview:hvc.view];等同于 [_window makeKeyAndVisible];+ [_window addSubview:hvc.view]效果，必须单独写View，用conntroller的view不行
//        [_window addSubview:hvc.view];//一定要调用    [_window makeKeyAndVisible];
    }
    else{
        //不是第一次启动
        [[NSUserDefaults standardUserDefaults] setObject:@(NO) forKey:@"firstLaunch"];
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
