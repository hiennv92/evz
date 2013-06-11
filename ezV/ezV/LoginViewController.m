//
//  LoginViewController.m
//  ezV
//
//  Created by papo on 5/18/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"


@interface LoginViewController (){
    AppDelegate *myApp;
}

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
    myApp = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [m_LoginButton setTitle:((databaseList*)[myApp.arrayLanguage objectAtIndex:DATA_LOGIN_KEY]).language forState:UIControlStateNormal];
    [m_SignUpButton setTitle:((databaseList*)[myApp.arrayLanguage objectAtIndex:DATA_REMEMBER_KEY]).language forState:UIControlStateNormal];
    [self.labelPassword setText:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LABEL_PASS_KEY]).language];
     [self.labelUserName setText:((databaseList *)[myApp.arrayLanguage objectAtIndex:DATA_LABEL_USERNAME_KEY]).language];
//    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [m_PasswordTextField setDelegate:self];
    [m_UserNameTextField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)signInButtonPressed:(id)sender {
    if ([self checkValidStringName]) {
        [self messageAlert:@"Dang nhap"];
    }
    else{
        
    }
}

-(IBAction)signUpButtonPressed:(id)sender {
    [self messageAlert: @"Dang ky"];
}

- (IBAction)returnMenu:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

-(BOOL)checkValidStringName{
    if ([m_UserNameTextField.text isEqualToString:@""]) {
        [self messageAlert:@"Ban chua nhap ten tai khoan"];
        return NO;
    }
    if ([m_PasswordTextField.text isEqualToString:@""]) {
        [self messageAlert:@"Ban chua nhap mat khau"];
        return NO;
    }
    return YES;
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
    return YES;
}

- (void)viewDidUnload {
    [self setLabelUserName:nil];
    [self setLabelPassword:nil];
    [super viewDidUnload];
}
@end
