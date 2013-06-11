//
//  coursesViewController.h
//  ezV
//
//  Created by Duong on 6/11/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginLayout.h"
#import "SettingManager.h"
#import "databaseList.h"
#import "NSMutableData_LanguageLayout.h"

#define LOGIN_INDICATOR_SHOW_TIME 30
#define LOGIN_REGIST_ALERT_TAG 1
#define LOGIN_LOGIN_ALERT_TAG 3
#define LOGIN_REGIST_ALERT_REMIND_TAG 2
#define LOGIN_LOGIN_REMIND_ALERT_TAG 4
#define LOGIN_REGIST_RESUTL_SUCSESS_TAG 5
#define LOGIN_LOGIN_RESULT_SUCCESS_TAG 6
#define LOGIN_REGIST_RESUTL_FAIL_TAG 7
#define LOGIN_LOGIN_RESULT_FAIL_TAG 8

@interface coursesViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UITableViewDataSource, UITableViewDelegate>{
    UIAlertView *loginAlertView;
    UIButton *btnRemember,*btnLogin,*btnCancel,*btnRegister;
	UILabel *lblName,*lblPass,*lblRemember,*lblLogin;
	UITextField *txtfName,*txtfPass;
    
    id appDelegate;
    id owner;
    BOOL isWaitResponse,isShow,onCreateIndicator;
	UIActivityIndicatorView *indicator;
	int indicatorTimeCountDown;
	NSTimer *indicatorTimer;
    
    
    NSMutableArray *arrayOfCourses;

}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)buttonBackMenu:(id)sender;

-(void)ShowIndicator;
-(void)StopIndicator;
-(void)IndicatorTimeCountDown;
-(void)StopIndicatorTimer;
-(void)MakeLoginView;
@end
