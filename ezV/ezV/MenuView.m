//
//  MenuView.m
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "MenuView.h"
#import "LoginViewController.h"
#import "LearnViewController.h"
#import "TestViewController.h"
#import "AppDelegate.h"
#import "GetDataLanguages.h"

@interface MenuView (){
    AppDelegate *myApp;
}

@end

@implementation MenuView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    myApp = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    myApp.chooseLanguage = 4;
    if(myApp.chooseLanguage == 1)
        NSLog(@"ENGLISH");
    else if(myApp.chooseLanguage == 2)
        NSLog(@"JAPANESE");
    else if(myApp.chooseLanguage == 3)
        NSLog(@"CHINESE");
    else
        NSLog(@"VIETNAMESE");
    
    [self.learn.titleLabel setText: [GetDataLanguages GetStringForKey:DATA_LEARN_KEY andChooseLanguages:myApp.chooseLanguage]];
    [self.test.titleLabel setText:[GetDataLanguages GetStringForKey:DATA_TEST_KEY andChooseLanguages:myApp.chooseLanguage]];
    [self.help.titleLabel setText:[GetDataLanguages GetStringForKey:DATA_HELP_KEY andChooseLanguages:myApp.chooseLanguage]];
    [self.listOfCourses.titleLabel setText:[GetDataLanguages GetStringForKey:DATA_COURSE_KEY andChooseLanguages:myApp.chooseLanguage]];
    [self.setting.titleLabel setText:[GetDataLanguages GetStringForKey:DATA_SETTING_KEY andChooseLanguages:myApp.chooseLanguage]];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonLearn:(id)sender {
    NSLog(@"Choose Learn VietNamese");
    LearnViewController *learnVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        learnVC = [[LearnViewController alloc]initWithNibName:@"LearnViewController_ipad" bundle:[NSBundle mainBundle]];
    }
    else{
          learnVC = [[LearnViewController alloc]initWithNibName:@"LearnViewController_iphone" bundle:[NSBundle mainBundle]];
    }
    [self presentModalViewController:learnVC animated:YES];
}

- (IBAction)buttonTest:(id)sender {
    NSLog(@"Choose Test VietNamese");
    TestViewController *testVC;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        testVC = [[TestViewController alloc]initWithNibName:@"TestViewController_ipad" bundle:[NSBundle mainBundle]];
    }
    else{
        testVC = [[TestViewController alloc]initWithNibName:@"TestViewController_iphone" bundle:[NSBundle mainBundle]];
    }
    [self presentModalViewController:testVC animated:YES];
}


- (IBAction)buttonAddNewCourse:(id)sender {
    NSLog(@"Choose add new course");
    LoginViewController *loginVC;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController_ipad" bundle:[NSBundle mainBundle]];
    }
    else{
        loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController_iphone" bundle:[NSBundle mainBundle]];
    }
    [self presentModalViewController:loginVC animated:YES];
}

- (IBAction)buttonHelp:(id)sender {
    NSLog(@"Choose help");
}

- (IBAction)buttonInfo:(id)sender {
    NSLog(@"Choose watch information");
}

- (IBAction)buttonSetting:(id)sender {
    NSLog(@"Choose setting");
}
- (void)viewDidUnload {
    [self setLearn:nil];
    [self setTest:nil];
    [self setListOfCourses:nil];
    [self setHelp:nil];
    [self setSetting:nil];
    [super viewDidUnload];
}
@end
