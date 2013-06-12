//
//  LanguageVC.h
//  ezV
//
//  Created by Duong on 6/12/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageVC : UIViewController<UITextFieldDelegate>{
    
}
@property (strong, nonatomic) IBOutlet UITextField *textFieldLanguage;
@property (strong, nonatomic) IBOutlet UISegmentedControl *langSelect;
- (IBAction)LangSegmented:(id)sender;
- (IBAction)buttonContinue:(id)sender;

@end
