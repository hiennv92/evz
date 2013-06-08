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
    
    NSString *alertMenuTitle = [GetDataLanguages GetStringForKey:DATA_ALERTMENUTITLE_KEY andChooseLanguages:myApp.chooseLanguage];
    NSString *alertMenuMessage = [GetDataLanguages GetStringForKey:DATA_ALERTMENUMESS_KEY andChooseLanguages:myApp.chooseLanguage];
    NSString *alertMenuCancelButtonTitle = [GetDataLanguages GetStringForKey:DATA_TITLECANCEL_KEY andChooseLanguages:myApp.chooseLanguage];
    NSString *alertMenuStudyButtonTitle = [GetDataLanguages GetStringForKey:DATA_LEARN_KEY andChooseLanguages:myApp.chooseLanguage];
    NSString *alertMenuTestButtonTitle = [GetDataLanguages GetStringForKey:DATA_TEST_KEY andChooseLanguages:myApp.chooseLanguage];
    
    UIAlertView *alertMenu = [[UIAlertView alloc] initWithTitle:alertMenuTitle message:alertMenuMessage delegate:self cancelButtonTitle:alertMenuCancelButtonTitle otherButtonTitles:alertMenuStudyButtonTitle,alertMenuTestButtonTitle, nil];
    
    [alertMenu show];
    alertMenu.tag = MENU_ALERT_TAG;
    [self MakeLoginView];
    
    [self.learn.titleLabel setText: [GetDataLanguages GetStringForKey:DATA_LEARN_KEY andChooseLanguages:myApp.chooseLanguage]];
    [self.test.titleLabel setText:[GetDataLanguages GetStringForKey:DATA_TEST_KEY andChooseLanguages:myApp.chooseLanguage]];
    [self.help.titleLabel setText:[GetDataLanguages GetStringForKey:DATA_HELP_KEY andChooseLanguages:myApp.chooseLanguage]];
    [self.listOfCourses.titleLabel setText:[GetDataLanguages GetStringForKey:DATA_COURSE_KEY andChooseLanguages:myApp.chooseLanguage]];
    [self.setting.titleLabel setText:[GetDataLanguages GetStringForKey:DATA_SETTING_KEY andChooseLanguages:myApp.chooseLanguage]];
    
    self.learn.hidden = YES;
    self.test.hidden = YES;
    self.help.hidden = YES;
    self.setting.hidden = YES;
    self.listOfCourses.hidden = YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)MakeLoginView{
    loginAlertView = [[UIAlertView alloc] initWithTitle:@"Đăng nhập"
                                                message:@"Nhập thông tin tài khoản của ban"
                                               delegate:self
                                      cancelButtonTitle:@"Đăng nhập"
                                      otherButtonTitles:@"Đăng ký", nil];
    [loginAlertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    
    loginAlertView.tag = LOGIN_LOGIN_ALERT_TAG;
}

//Cac lua chon cho AlertView cua tung muc
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSInteger alertTag = alertView.tag;
    //Xoá thể loại trên bảng các thể loại thu chi
    if(alertTag == LOGIN_LOGIN_ALERT_TAG){
        if(buttonIndex == 0){
            int test1 = 0;
            int test2 = 0;
            
            for(int i = 0;i<[[alertView textFieldAtIndex:0].text length];i++){
                if([[alertView textFieldAtIndex:0].text characterAtIndex:i] == ' '){
                    test1 ++;
                }
            }
            
            for(int i = 0;i<[[alertView textFieldAtIndex:1].text length];i++){
                if([[alertView textFieldAtIndex:1].text characterAtIndex:i] == ' '){
                    test2 ++;
                }
            }
            //Truong hop field khoan thu hoac field so tien bi bo trong thi se hien ra thong bao
            if([alertView textFieldAtIndex:0].text == nil||test1 == [[alertView textFieldAtIndex:0].text length]||[alertView textFieldAtIndex:1].text == nil || test2 == [[alertView textFieldAtIndex:1].text length]){
                NSLog(@"Nhap thieu du lieu:");
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Lỗi đăng nhập"
                                                                 message:@"Xin hãy điền đầy đủ thông tin tài khoản!"
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
                [alert show];
                alert.tag = LOGIN_LOGIN_REMIND_ALERT_TAG;
            }
            else{
//                chooseActionAfterParserData = 0;
                [NSThread detachNewThreadSelector:@selector(ShowIndicator) toTarget:self withObject:nil];
                indicatorTimeCountDown = LOGIN_INDICATOR_SHOW_TIME;
                indicatorTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(IndicatorTimeCountDown) userInfo:nil repeats:YES];
                
                NSLog(@"User Name send: %@",[alertView textFieldAtIndex:0].text);
                NSLog(@"Pass send: %@",[alertView textFieldAtIndex:1].text);
//                DataParse *tmp = [[DataParse alloc]init];
//                NSString *stringJson = [tmp setDataSignInToJson:[alertView textFieldAtIndex:0].text andPass:[alertView textFieldAtIndex:1].text];
//                [self checkLogIn:stringJson];
            }
        }
        else{
//            RegisterView *registerView = [[RegisterView alloc]initWithNibName:@"RegisterView" bundle:nil];
//            [self presentModalViewController:registerView animated:YES];
        }
    }
    else if(alertTag == LOGIN_LOGIN_RESULT_FAIL_TAG){
        [loginAlertView show];
    }
    else if(alertTag == LOGIN_REGIST_ALERT_REMIND_TAG){
        
    }
    else if(alertTag == LOGIN_LOGIN_REMIND_ALERT_TAG){
        [loginAlertView show];
    }
    else if(alertTag == MENU_ALERT_TAG){
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
            [self presentModalViewController:testVC animated:YES];        }
        else {
            self.learn.hidden = NO;
            self.test.hidden = NO;
            self.help.hidden = NO;
            self.setting.hidden = NO;
            self.listOfCourses.hidden = NO;
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
    [loginAlertView show];
//    LoginViewController *loginVC;
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController_ipad" bundle:[NSBundle mainBundle]];
//    }
//    else{
//        loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController_iphone" bundle:[NSBundle mainBundle]];
//    }
//    [self presentModalViewController:loginVC animated:YES];
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

-(void) ShowIndicator
{
    //	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    onCreateIndicator = TRUE;
	if(indicator == nil)
	{
		indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	}
	[indicator setFrame:CGRectMake(135, 215, 50, 50)];
	[self.view addSubview:indicator];
	[indicator startAnimating];
	onCreateIndicator = FALSE;
}
-(void) StopIndicator
{
    while (onCreateIndicator) ;
    
    if (indicator != nil)
	{
		[indicator removeFromSuperview];
		[indicator stopAnimating];
		indicator = nil;
	}
}
-(void) IndicatorTimeCountDown
{
	NSLog(@"IndicatorTimeCountDown still run %d",indicatorTimeCountDown);
	indicatorTimeCountDown--;
    isWaitResponse = TRUE;
	if(indicatorTimeCountDown ==0)
	{
		[self StopIndicator];
		[indicatorTimer invalidate];
		indicatorTimer = nil;
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Kết nối lỗi! Bạn vui lòng thử lại!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = LOGIN_LOGIN_RESULT_FAIL_TAG;
		[alert show];
        isWaitResponse = FALSE;
	}
}
-(void) StopIndicatorTimer
{
	if(indicatorTimer != nil)
	{
		if([indicatorTimer isValid])
		{
			[indicatorTimer invalidate];
			indicatorTimer = nil;
		}
	}
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
