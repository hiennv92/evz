//
//  MenuView.h
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginLayout.h"
#import "SettingManager.h"
#import "RegisterView.h"
#import "LoginViewController.h"
#import "LearnViewController.h"
#import "TestViewController.h"
#import "myDatabaseList.h"
#import "databaseList.h"
#import "NSMutableData_LanguageLayout.h"

#define MENU_ALERT_TAG 10

@interface MenuView : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>{
    NSMutableArray *dataUsers;
   
}

- (IBAction)buttonLearn:(id)sender;
- (IBAction)buttonTest:(id)sender;
- (IBAction)buttonAddNewCourse:(id)sender;
- (IBAction)buttonHelp:(id)sender;
- (IBAction)buttonInfo:(id)sender;
- (IBAction)buttonSetting:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *learn;
@property (strong, nonatomic) IBOutlet UIButton *test;
@property (strong, nonatomic) IBOutlet UIButton *listOfCourses;
@property (strong, nonatomic) IBOutlet UIButton *help;
@property (strong, nonatomic) IBOutlet UIButton *setting;

-(void)loadInterface;
//-(void)parserResponse:(NSString*)stringResponse;


@end
