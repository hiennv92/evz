//
//  LoginViewController.h
//  ezV
//
//  Created by papo on 5/18/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField* m_UserNameTextField;
    IBOutlet UITextField* m_PasswordTextField;
    IBOutlet UIButton*    m_LoginButton;
    IBOutlet UIButton*    m_SignUpButton;
}

-(IBAction)signInButtonPressed:(id)sender;
-(IBAction)signUpButtonPressed:(id)sender;
- (IBAction)returnMenu:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labelUserName;
@property (strong, nonatomic) IBOutlet UILabel *labelPassword;
@end
