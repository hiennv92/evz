//
//  MenuView.h
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIViewController

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

@end
