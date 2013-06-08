//
//  MenuView.h
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LOGIN_INDICATOR_SHOW_TIME 60
#define LOGIN_REGIST_ALERT_TAG 1
#define LOGIN_LOGIN_ALERT_TAG 3
#define LOGIN_REGIST_ALERT_REMIND_TAG 2
#define LOGIN_LOGIN_REMIND_ALERT_TAG 4
#define MENU_ALERT_TAG 10
#define LOGIN_REGIST_RESUTL_SUCSESS_TAG 5
#define LOGIN_LOGIN_RESULT_SUCCESS_TAG 6
#define LOGIN_REGIST_RESUTL_FAIL_TAG 7
#define LOGIN_LOGIN_RESULT_FAIL_TAG 8

@interface MenuView : UIViewController{
    NSMutableArray *dataUsers;
    UIAlertView *loginAlertView;
    id appDelegate;
    id owner;
    BOOL isWaitResponse,isShow,onCreateIndicator;
	UIActivityIndicatorView *indicator;
	int indicatorTimeCountDown;
	NSTimer *indicatorTimer;

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

-(void)ShowIndicator;
-(void)StopIndicator;
-(void)IndicatorTimeCountDown;
-(void)StopIndicatorTimer;
-(void)MakeLoginView;
//-(void)parserResponse:(NSString*)stringResponse;


@end