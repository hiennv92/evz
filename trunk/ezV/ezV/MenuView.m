//
//  MenuView.m
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "MenuView.h"
#import "AppDelegate.h"

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
    
    [self hiddenButton];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.    
}

////////TESTWEBSERVICES///////////////////////
-(void)getDataTest:(NSString*) stringUsername andPass:(NSString*) stringPass{
    NSString *stringURL = [NSString stringWithFormat:@"http://easyvietnamese.com/ws/login?name=%@&pass=%@",stringUsername,stringPass];
    
    NSURL *urltest = [NSURL URLWithString:stringURL];

    ////////TEST WEBSERVICES///////////////////
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        urltest];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    //////////////TEST WEBSERVICES////////////
}
- (void)fetchedData:(NSData *)responseData {
    [self StopIndicator];
    [self StopIndicatorTimer];
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray *arrayMess = [json objectForKey:@"msg"]; //2
    NSArray *arrayResult = [json objectForKey:@"result"];
    NSArray *arraySID = [json objectForKey:@"sid"];
//    NSDictionary *mess = [arrayMess objectAtIndex:0];
//    NSDictionary *result = [arryResult objectAtIndex:0];
    
    NSLog(@"Mess: %@",arrayMess);
    NSLog(@"result: %@", arrayResult);
    NSLog(@"Sid: %@", arraySID);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) MakeLoginView
{
	if(lblPass == nil)
	{
		lblPass = [[UILabel alloc] init];
		[lblPass setBackgroundColor:[UIColor clearColor]];
		[lblPass setTextColor:[UIColor whiteColor]];
		[lblPass setText:[GetDataLanguages GetStringForKey:DATA_PASS_KEY andChooseLanguages:myApp.chooseLanguage]];
		[lblPass setFrame:F_LOGIN_LBL_PASS];
	}
	if(lblRemember == nil)
	{
		lblRemember = [[UILabel alloc] init];
		[lblRemember setBackgroundColor:[UIColor clearColor]];
		[lblRemember setTextColor:[UIColor whiteColor]];
		[lblRemember setText:[GetDataLanguages GetStringForKey:DATA_REMEMBERLABEL_KEY andChooseLanguages:myApp.chooseLanguage]];
		[lblRemember setFrame:F_LOGIN_LBL_REMEMBER];
	}
	if(lblName == nil)
	{
		lblName = [[UILabel alloc] init];
		[lblName setBackgroundColor:[UIColor clearColor]];
		[lblName setTextColor:[UIColor whiteColor]];
		[lblName setText:[GetDataLanguages GetStringForKey:DATA_USERNAME_KEY andChooseLanguages:myApp.chooseLanguage]];
		[lblName setFrame:F_LOGIN_LBL_NAME];
	}
	if(btnRemember==nil)
	{
		btnRemember = [[UIButton alloc] init];
		[btnRemember setFrame:F_LOGIN_REMEMBER_BUTTON];
		if([SettingManager GetAllowRememberAccountPermition])
			[btnRemember setBackgroundImage:[UIImage imageNamed:IMG_LOGIN_REMEMBER_CHECKED] forState:0];
		else
			[btnRemember setBackgroundImage:[UIImage imageNamed:IMG_LOGIN_REMEMBER_UNCHECKED] forState:0];
		[btnRemember addTarget:self action:@selector(OnLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
	}
	if(txtfName == nil)
	{
		txtfName = [[UITextField alloc] init];
		[txtfName setBorderStyle:UITextBorderStyleRoundedRect];
		[txtfName setTextAlignment:UITextAlignmentCenter];
		txtfName.placeholder = [GetDataLanguages GetStringForKey:DATA_USERNAME_KEY andChooseLanguages:myApp.chooseLanguage];
		txtfName.returnKeyType = UIReturnKeyDone;
		txtfName.delegate = self;
		[txtfName setFrame:F_LOGIN_TXTF_NAME];
	}
	if(txtfPass == nil)
	{
		txtfPass = [[UITextField alloc] init];
		[txtfPass setBorderStyle:UITextBorderStyleRoundedRect];
		[txtfPass setTextAlignment:UITextAlignmentCenter];
		txtfPass.placeholder = [GetDataLanguages GetStringForKey:DATA_PASS_KEY andChooseLanguages:myApp.chooseLanguage];
		txtfPass.returnKeyType = UIReturnKeyDone;
		txtfPass.secureTextEntry = TRUE;
		txtfPass.delegate = self;
		[txtfPass setFrame:F_LOGIN_TXTF_PASS];
	}
		
	[lblName removeFromSuperview];
	[lblPass removeFromSuperview];
	[lblRemember removeFromSuperview];
	[txtfName removeFromSuperview];
	[txtfPass removeFromSuperview];
	[btnRemember removeFromSuperview];
	
	loginAlertView = [[UIAlertView alloc] initWithTitle:[GetDataLanguages GetStringForKey:DATA_ALERTLOGINTITLE_KEY andChooseLanguages:myApp.chooseLanguage]
                                            message:nil
                                            delegate:self
                                            cancelButtonTitle:[GetDataLanguages GetStringForKey:DATA_TITLECANCEL_KEY andChooseLanguages:myApp.chooseLanguage]
                                            otherButtonTitles:[GetDataLanguages GetStringForKey:DATA_LOGIN_KEY andChooseLanguages:myApp.chooseLanguage],[GetDataLanguages GetStringForKey:DATA_REGISTER_KEY andChooseLanguages:myApp.chooseLanguage],nil];
	loginAlertView.tag = LOGIN_LOGIN_ALERT_TAG;
    txtfName.tag = 1;
    txtfPass.tag = 2;
    
	[loginAlertView addSubview:lblName];
	[loginAlertView addSubview:txtfName];
	[loginAlertView addSubview:lblPass];
	[loginAlertView addSubview:txtfPass];
	[loginAlertView addSubview:btnRemember];
	[loginAlertView addSubview:lblRemember];
}

-(void) OnLoginButtonClicked:(UIButton *)sender
{
	if(isWaitResponse) return;
    if(sender == btnRemember)
	{
        if([SettingManager GetAllowRememberAccountPermition])
        {
            [SettingManager SaveAllowRememberAccuntPermittion:FALSE];
            [btnRemember setBackgroundImage:[UIImage imageNamed:IMG_LOGIN_REMEMBER_UNCHECKED] forState:0];
        }
        else
        {
            [SettingManager SaveAllowRememberAccuntPermittion:TRUE];
            [btnRemember setBackgroundImage:[UIImage imageNamed:IMG_LOGIN_REMEMBER_CHECKED] forState:0];
        }
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark UIAlertView delegate
-(void) willPresentAlertView:(UIAlertView *)alertView
{
    if(alertView.tag == LOGIN_LOGIN_ALERT_TAG)
    {
        [alertView setFrame:F_LOGIN_ALERT];
		
        float ver = [[[UIDevice currentDevice] systemVersion] floatValue];
        NSLog(@"OS Version:  %f",ver);
        if(ver  < 5.0)
        {
            int i=0;
            
            for(UIView *v in alertView.subviews)
            {
                NSLog(@"CheckButton in alert: %@",[v class]);
                NSString *class = [NSString stringWithFormat:@"%@",[v class]];
                if([class isEqualToString:@"UIThreePartButton"])
                {
                    i++;
                    if(i==1)
                        [v setFrame:F_LOGIN_CLOSE_BUTTON];
                    else if(i==2)
                        [v setFrame:F_LOGIN_LOGIN_BUTTON];
                    else if(i==3)
                        [v setFrame:F_LOGIN_REGISTER_BUTTON];
                }
            }
        }
        else
        {
            int i=0;
            for(UIView *v in alertView.subviews)
            {
                if([v isKindOfClass:[UIButton class]])
                {
                    if(i==0)
                        [v setFrame:F_LOGIN_CLOSE_BUTTON];
                    else if(i==1)
                        [v setFrame:F_LOGIN_LOGIN_BUTTON];
                    else if(i==2)
                        [v setFrame:F_LOGIN_REGISTER_BUTTON];
                    i++;
                }
            }
        }
        
        if(myApp.userName == NULL){
            txtfName.text = @"lampsea";
            txtfPass.text = @"123456";
        }
        else{
            txtfName.text = myApp.userName;
            txtfPass.text = myApp.pass;
        }
    }
}


//Cac lua chon cho AlertView cua tung muc
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSInteger alertTag = alertView.tag;
    //Xoá thể loại trên bảng các thể loại thu chi
    if(alertTag == LOGIN_LOGIN_ALERT_TAG){
        if(buttonIndex == 1){
            int test1 = 0;
            int test2 = 0;
            
            for(int i = 0;i<[txtfName.text length];i++){
                if([txtfName.text characterAtIndex:i] == ' '){
                    test1 ++;
                }
            }
            
            for(int i = 0;i<[txtfPass.text length];i++){
                if([txtfPass.text characterAtIndex:i] == ' '){
                    test2 ++;
                }
            }
            
            if(txtfName.text == nil||test1 == [txtfName.text length]||txtfPass.text == nil || test2 == [txtfPass.text length]){
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
                
                NSLog(@"User Name send: %@",txtfName.text);
                NSLog(@"Pass send: %@",txtfPass.text);
                DataParse *tmp = [[DataParse alloc]init];
//                NSString *stringJson = [tmp setDataSignInToJson:txtfName.text andPass:txtfPass.text];
//                [self checkLogIn:stringJson];
                [self hiddenButton];
                [self getDataTest:txtfName.text andPass: txtfPass.text];
            }
        }
        else if(buttonIndex == 2){
            RegisterView *registerView = [[RegisterView alloc]initWithNibName:@"RegisterView" bundle:nil];
            [self presentModalViewController:registerView animated:YES];
        }
        else if(buttonIndex == 0){
            [self showButton];
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
    [loginAlertView show];
    [self hiddenButton];
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
@end
