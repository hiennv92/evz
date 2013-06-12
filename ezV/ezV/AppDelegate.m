//
//  AppDelegate.m
//  ezV
//
//  Created by papo on 5/18/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize chooseLanguage = _chooseLanguage;
@synthesize userName = _userName;
@synthesize pass = _pass;
@synthesize theFirst = _theFirst;
@synthesize arrayLanguage;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.theFirst = YES;
    //Check fist run
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"firstRun"]){
        [defaults setObject:@"true" forKey:@"firstRun"];
        
        NSLog(@"Chay ung dung lan dau tien");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.langVC = [[LanguageVC alloc] initWithNibName:@"LanguageVC" bundle:[NSBundle mainBundle]];
        }
        else{
            self.langVC = [[LanguageVC alloc] initWithNibName:@"LanguageVC_iphone" bundle:[NSBundle mainBundle]];
        }
        [self.window setRootViewController:self.langVC];
	}
    else{
        NSString *stringLanguage;
        stringLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:@"language"];

        if([stringLanguage isEqualToString:@"english"]){
            self.chooseLanguage = 1;
            NSLog(@"ENGLISH");
        }
        else if([stringLanguage isEqualToString:@"japanese"]){
            self.chooseLanguage = 2;
            NSLog(@"JAPANESE");
        }
        else if([stringLanguage isEqualToString:@"chinese"]){
            self.chooseLanguage = 3;
            NSLog(@"CHINESE");
        }
        else{
            NSLog(@"VIETNAMESE");
        }

        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.menuVC = [[MenuView alloc] initWithNibName:@"MenuView_ipad" bundle:[NSBundle mainBundle]];
        }
        else{
            self.menuVC = [[MenuView alloc] initWithNibName:@"MenuView_iphone" bundle:[NSBundle mainBundle]];
        }
        [self.window setRootViewController:self.menuVC];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];

    
//    [self.window setRootViewController:self.loginVC];
    [self.window makeKeyAndVisible];
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
