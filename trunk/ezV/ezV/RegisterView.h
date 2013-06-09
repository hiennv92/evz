//
//  RegisterView.h
//  ProjectII
//
//  Created by Lion User on 09/05/2013.
//  Copyright (c) 2013 Lampsea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataParse.h"

@interface RegisterView : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,NSXMLParserDelegate,NSURLConnectionDelegate>{
    int switchButton;
}

- (IBAction)buttonFinish:(id)sender;
- (IBAction)buttonCancel:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbTitle;
@property (strong, nonatomic) IBOutlet UILabel *lbName;
@property (strong, nonatomic) IBOutlet UILabel *lbUserName;
@property (strong, nonatomic) IBOutlet UILabel *labelPass;
@property (strong, nonatomic) IBOutlet UILabel *lbRepass;
@property (strong, nonatomic) IBOutlet UILabel *labelEmail;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonCancel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonDone;

@property (strong, nonatomic) IBOutlet UITextField *fieldName;
@property (strong, nonatomic) IBOutlet UITextField *fieldNameSignin;
@property (strong, nonatomic) IBOutlet UITextField *fieldPass;
@property (strong, nonatomic) IBOutlet UITextField *fieldRepass;
@property (strong, nonatomic) IBOutlet UITextField *fieldEmail;
@property (strong, nonatomic) IBOutlet UIView *signForm;


@end
