//
//  LoginViewController.m
//  ezV
//
//  Created by papo on 5/18/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [m_PasswordTextField setDelegate:self];
    [m_UserNameTextField setDelegate:self];
    [UIView animateWithDuration:1.0f animations:^() {
        [m_Logo setAlpha:1.0f];
    }];
//    m_LanguagePickView 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)signInButtonPressed:(id)sender {
    int kCheck = [self checkValidStringName];
    switch (kCheck) {
        case 0:
            [self messageAlert:@"Dang nhap"];
            break;
        case 1:
            [self messageAlert:@"Ban chua nhap ten tai khoan"];
            break;
        case 2:
            [self messageAlert:@"Ban chua nhap mat khau"];
            break;
        default:
            break;
    }
}

-(IBAction)signUpButtonPressed:(id)sender {
    int kCheck = [self checkValidStringName];
    switch (kCheck) {
        case 0:
            [self messageAlert:@"Dang ky"];
            break;
        case 1:
            [self messageAlert:@"Ban chua nhap ten tai khoan"];
            break;
        case 2:
            [self messageAlert:@"Ban chua nhap mat khau"];
            break;
        default:
            break;
    }
}

-(int)checkValidStringName{
    if ([[self formatString:m_UserNameTextField.text] isEqualToString:@""]) {
        return 1;
    }
    if ([m_PasswordTextField.text isEqualToString:@""]) {
        return 2;
    }
    return 0;
}

-(NSString*)formatString:(NSString*)string{
    return [string stringByReplacingOccurrencesOfString:@" " withString:@""];
}

-(void)messageAlert:(NSString*)alarm {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Thong bao" message:alarm delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    alert = nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [m_PasswordTextField resignFirstResponder];
    [m_UserNameTextField resignFirstResponder];
}


//
#pragma UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == m_PasswordTextField) {
        [self signInButtonPressed:nil];
    }
    else if (textField == m_UserNameTextField){
        [m_PasswordTextField becomeFirstResponder];
    }
    return YES;
}

//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    [m_LanguagePickView showsSelectionIndicator];
////    m_LanguagePickView hi
//}

@end
