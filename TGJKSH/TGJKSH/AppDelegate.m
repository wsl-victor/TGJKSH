//
//  AppDelegate.m
//  TGJKSH
//
//  Created by victor on 16/9/6.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "AppDelegate.h"
#import "TGGuideViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.rootViewController=[[TGGuideViewController alloc] init];
    // 2.显示窗口(成为主窗口)
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



//=-============http://www.jianshu.com/p/ffd5ac9d41b3
//- (void)openAPPHandle
//{
//    // 1 ------------------是否配置启动页面?
//    LaunchModel *launchModel = [self isSettingLaunch];
//    if(launchModel.launchImage)// 1-YES: 若配置了启动页，则进入启动页
//    {
//        [self enterLaunchView:launchModel];
//    }
//    else // 1-NO:  若没配置启动页，则判断是否是第一次启动
//    {
//        // 2 ------------------是否第一次启动?
//        if(![PubicClassMethod appFirstUserd]) // 2-YES: 第一次启动，则进入引导页
//        {
//            [self enterGuideView];
//        }
//        else // 2-NO:不是第一次启动，则判断是否登录？
//        {
//            // 3 ------------------是否登录？
//            BOOL isLogin = [[NSUserDefaults standardUserDefaults] boolForKey:kUserLoginStatus];
//            if(isLogin) // 3-YES:若是登录状态，则进入主界面
//            {
//                [self enterHomeView];
//            }
//            else
//            {
//                // 3-NO:若是未登陆了状态，则进入登录界面
//                [self enterLoginView];
//            }
//        }
//        
//        
//    }
//}
//
//// 是否设置启动页面
//- (LaunchModel *)isSettingLaunch
//{
//    NSData *launchData = (NSData *)[[NSUserDefaults standardUserDefaults] objectForKey:@"launchImg"];
//    LaunchModel *launch = (LaunchModel *)[NSKeyedUnarchiver unarchiveObjectWithData:launchData];
//    
//    return launch;
//}
//
//
//
//// 进入启动页
//- (void)enterLaunchView:(LaunchModel *)launchModel
//{
//    LaunchViewController *launchVC = [LaunchViewController new];
//    launchVC.launchModel = launchModel;
//    UINavigationController *launchNavC = [[UINavigationController alloc] initWithRootViewController:launchVC];
//    launchNavC.navigationBarHidden = YES;
//    self.window.rootViewController = launchNavC;
//}
//
//// 进入引导页
//- (void)enterGuideView
//{
//    [PubicClassMethod saveAppFirstUserd:YES];
//    ZJNewcomerGuidViewController *guidVC = [[ZJNewcomerGuidViewController alloc]init];
//    self.window.rootViewController = guidVC;
//}
//
//
//// 进入主界面
//- (void)enterHomeView
//{
//    HomeViewController *homeVC = [[HomeViewController alloc] init];
//    self.homeController = homeVC;
//    UINavigationController *homeNavC = [[UINavigationController alloc] initWithRootViewController:homeVC];
//    homeNavC.navigationBarHidden = YES;
//    self.window.rootViewController = homeNavC;
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//}
//
//
//
//
//// 进入登录界面
//- (void)enterLoginView
//{
//    LoginViewController *loginVC = [[LoginViewController alloc] init];
//    UINavigationController *loginNavC = [[UINavigationController alloc] initWithRootViewController:loginVC];
//    loginNavC.navigationBarHidden = YES;
//    self.window.rootViewController = loginNavC;
//    [self.window makeKeyAndVisible];
//}
//
//
//// 是否登录：进入主界面还是登录界面？
//- (void)enterHomeOrLoginView
//{
//    RUNDUG(@"%s",__func__);
//    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
//    BOOL isLogin = [[NSUserDefaults standardUserDefaults] boolForKey:kUserLoginStatus];
//    if (isLogin) // 若已登录，则进入主界面
//    {
//        [appDelegate enterHomeView];
//    }
//    else // 若未登录，则进入登录界面
//    {
//        [appDelegate enterLoginView];
//    }
//}
//
//
//// 是否第一次启动：进入引导页或者其他
//- (void)enterGuideOrOther
//{
//    if(![PubicClassMethod appFirstUserd])
//    {
//        [self enterGuideView];
//    }
//    else
//    {
//        [self enterHomeOrLoginView];
//    }
//}
//============================

@end
