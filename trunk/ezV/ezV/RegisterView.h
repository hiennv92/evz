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
    int switchDataParser;
}

- (IBAction)buttonFinish:(id)sender;
- (IBAction)buttonCancel:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *fieldName;
@property (strong, nonatomic) IBOutlet UITextField *fieldNameSignin;
@property (strong, nonatomic) IBOutlet UITextField *fieldPass;
@property (strong, nonatomic) IBOutlet UITextField *fieldRepass;
@property (strong, nonatomic) IBOutlet UITextField *fieldEmail;

@property (strong, nonatomic) IBOutlet UIView *signForm;

@property (retain, nonatomic) NSMutableData *webData;
@property (retain, nonatomic) NSXMLParser *xmlParser;
@property (retain, nonatomic) NSMutableString *nodeContent;
@property (retain, nonatomic) NSString *finaldata;
@property (nonatomic, retain) NSString *stringGroups;

@end
