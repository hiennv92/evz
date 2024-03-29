//
//  AppDelegate.h
//  ezV
//
//  Created by papo on 5/18/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "MenuView.h"
#import "LanguageVC.h"
#import "LoginLayout.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (assign, nonatomic) NSInteger chooseLanguage;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginViewController* loginVC;
@property (strong, nonatomic) MenuView *menuVC;
@property (strong, nonatomic) LanguageVC *langVC;
@property (assign, nonatomic) NSString *userName;
@property (assign, nonatomic) NSString *pass;
@property (assign, nonatomic) BOOL theFirst;
@property (nonatomic, retain) NSMutableArray *arrayLanguage;
@end
