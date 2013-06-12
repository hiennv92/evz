//
//  LanguageVC.m
//  ezV
//
//  Created by Duong on 6/12/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "LanguageVC.h"
#import "MenuView.h"
#import "AppDelegate.h"

@interface LanguageVC (){
    AppDelegate *myApp;
}

@end

@implementation LanguageVC
@synthesize langSelect;
@synthesize textFieldLanguage;

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
    [super viewDidLoad];
    self.textFieldLanguage.text = @"English";
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LangSegmented:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(self.langSelect.selectedSegmentIndex == 0){
        myApp.chooseLanguage = 1;
        self.textFieldLanguage.text = @"English";
        [defaults setObject:@"english" forKey:@"language"];
    }
    else if(self.langSelect.selectedSegmentIndex == 1){
        self.textFieldLanguage.text = @"Japanese";
        myApp.chooseLanguage = 2;
        [defaults setObject:@"japanese" forKey:@"language"];
    }
    else if(self.langSelect.selectedSegmentIndex == 2){
        myApp.chooseLanguage = 3;
        [defaults setObject:@"chinese" forKey:@"language"];
        self.textFieldLanguage.text = @"Chinese";
    }
}

- (IBAction)buttonContinue:(id)sender {
    NSLog(@"choose language: %@",[[NSUserDefaults standardUserDefaults]objectForKey:@"language"]);
    MenuView *menuVC;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        menuVC = [[MenuView alloc] initWithNibName:@"MenuView_ipad" bundle:[NSBundle mainBundle]];
    }
    else{
        menuVC = [[MenuView alloc] initWithNibName:@"MenuView_iphone" bundle:[NSBundle mainBundle]];
    }
    [self presentModalViewController:menuVC animated:YES];
}
- (void)viewDidUnload {
    [self setLangSelect:nil];
    [self setTextFieldLanguage:nil];
    [super viewDidUnload];
}
@end
