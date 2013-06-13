//
//  MenuView.m
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "MenuView.h"
#import "AppDelegate.h"
#import "coursesViewController.h"

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
    [self loadInterface];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



//Cac lua chon cho AlertView cua tung muc
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSInteger alertTag = alertView.tag;
   if(alertTag == MENU_ALERT_TAG){
        if(buttonIndex == 1){
            LearnViewController *learnVC;
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                learnVC = [[LearnViewController alloc]initWithNibName:@"LearnViewController_ipad" bundle:[NSBundle mainBundle]];
            }
            else{
                learnVC = [[LearnViewController alloc]initWithNibName:@"LearnViewController_iphone" bundle:[NSBundle mainBundle]];
            }
            [self presentModalViewController:learnVC animated:YES];
        }
        else if(buttonIndex == 2){
            TestViewController *testVC;
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                testVC = [[TestViewController alloc]initWithNibName:@"TestViewController_ipad" bundle:[NSBundle mainBundle]];
            }
            else{
                testVC = [[TestViewController alloc]initWithNibName:@"TestViewController_iphone" bundle:[NSBundle mainBundle]];
            }
            [self presentModalViewController:testVC animated:YES];
        }
        else {
            [self showButton];
        }
    }
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
    coursesViewController *coursesVC;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        coursesVC = [[coursesViewController alloc] initWithNibName:@"coursesViewController" bundle:[NSBundle mainBundle]];
    }
    else{
        coursesVC = [[coursesViewController alloc] initWithNibName:@"coursesViewController_iphone" bundle:[NSBundle mainBundle]];
    }
    [self presentModalViewController:coursesVC animated:YES];
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


-(void)hiddenButton{
    self.learn.hidden = YES;
    self.test.hidden = YES;
    self.help.hidden = YES;
    self.setting.hidden = YES;
    self.listOfCourses.hidden = YES;
}
-(void)showButton{
    self.learn.hidden = NO;
    self.test.hidden = NO;
    self.help.hidden = NO;
    self.setting.hidden = NO;
    self.listOfCourses.hidden = NO;
}
- (void)viewDidUnload {
    [self setLearn:nil];
    [self setTest:nil];
    [self setListOfCourses:nil];
    [self setHelp:nil];
    [self setSetting:nil];
    [super viewDidUnload];
}

-(void)loadInterface{
    //Load Languages
    myDatabaseList *dataLanguage = [[myDatabaseList alloc] init];
    myApp.chooseLanguage = 4;

    if(myApp.theFirst){
        if(myApp.chooseLanguage == 1){
            myApp.arrayLanguage = [dataLanguage getEnglish];
        }
        else if(myApp.chooseLanguage == 2){
            myApp.arrayLanguage = [dataLanguage getJapanese];
        }
        else if(myApp.chooseLanguage == 3){
            myApp.arrayLanguage = [dataLanguage getChinese];
        }
        else{
            myApp.arrayLanguage = [dataLanguage getVietNamese];
        }
    }
        
    NSString *alertMenuTitle = ((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_ALERT_KEY]).language;
    NSString *alertMenuMessage = ((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_MENUALERTMESS_KEY]).language;
    
    NSString *alertMenuCancelButtonTitle = ((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_CACEL_KEY]).language;
    NSString *alertMenuStudyButtonTitle = ((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_STUDY_KEY]).language;
    NSString *alertMenuTestButtonTitle = ((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_DOTEST_KEY]).language;
    
    UIAlertView *alertMenu = [[UIAlertView alloc] initWithTitle:alertMenuTitle message:alertMenuMessage delegate:self cancelButtonTitle:alertMenuCancelButtonTitle otherButtonTitles:alertMenuStudyButtonTitle,alertMenuTestButtonTitle, nil];
    if(myApp.theFirst){
        [alertMenu show];
        [self hiddenButton];
        myApp.theFirst = NO;
    }
    else
        [self showButton];
    alertMenu.tag = MENU_ALERT_TAG;
    
    [self.learn setTitle:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_STUDY_KEY]).language forState:UIControlStateNormal];
    [self.test setTitle:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_DOTEST_KEY]).language forState:UIControlStateNormal];
    [self.help setTitle:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_HELP_KEY]).language forState:UIControlStateNormal];
    [self.listOfCourses setTitle:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LISTOFCOURSE_KEY]).language forState:UIControlStateNormal];
    [self.setting setTitle:((databaseList *)[myApp.arrayLanguage objectAtIndex: DATA_SETTING_KEY]).language forState:UIControlStateNormal];
}
@end
