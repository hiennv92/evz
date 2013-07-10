//
//  LearnViewController.m
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "LearnViewController.h"
#import "AppDelegate.h"

@interface LearnViewController (){
    AppDelegate *myApp;
}

@end

@implementation LearnViewController

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
    myApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
    countTest = 0;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    MenuView *menuView;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        menuView = [[MenuView alloc] initWithNibName:@"MenuView_ipad" bundle:[NSBundle mainBundle]];
    }
    else{
        menuView = [[MenuView alloc] initWithNibName:@"MenuView_iphone" bundle:[NSBundle mainBundle]];
    }
    [self presentModalViewController:menuView animated:YES];
//    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setButtonBack:nil];
    [self setTitleLabel:nil];
    [self setLabelWord:nil];
    [self setLabelMean:nil];
    [self setLabelLesson:nil];
    [self setImageView:nil];
    [super viewDidUnload];
}

- (IBAction)buttonSound:(id)sender {
}

- (IBAction)buttonNext:(id)sender {
    if (countTest <5) {
        self.imageView.center = CGPointMake(160, 184);
        [UIView animateWithDuration:0.5
                         animations:^{self.imageView.center = CGPointMake(-160,184);}];
        [UIView beginAnimations:nil context:NULL];
        [UIView commitAnimations];
        
        [self performSelector:@selector(callNewImageView) withObject:nil afterDelay:0.5f];
        countTest ++;
    }
    else{
        NSLog(@"Het bai");
        NSString *stringTitle = ((databaseList*)[myApp.arrayLanguage objectAtIndex:DATA_ALERT_KEY]).language;
        NSString *stringMess = @"Bạn muốn học lại bài này lần nữa không?";
        NSString *butLearnConti = @"Tiếp tục";
        NSString *butTest = @"Làm bài kiểm tra";
        NSString *butLearnAnother = @"Đổi bài khác";
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: stringTitle
                                            message:stringMess
                                            delegate:self
                                            cancelButtonTitle:butLearnAnother
                                            otherButtonTitles:butLearnConti,butTest, nil];
        [alert show];
        alert.tag = 1;
    }
}

-(void)callNewImageView{
    self.imageView.center = CGPointMake(480, 184);
    [UIView animateWithDuration:0.5
                     animations:^{self.imageView.center = CGPointMake(160,184);}];
    [UIView beginAnimations:nil context:NULL];
    [UIView commitAnimations];
}


//Cac lua chon cho AlertView cua tung muc
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSInteger alertTag = alertView.tag;
    if(alertTag == 1){
        if(buttonIndex == 1){
            NSLog(@"Hoc tiep");
            countTest = 0;
        }
        else if(buttonIndex == 2){
            NSLog(@"Lam test");
            TestViewController *testVC;
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                testVC = [[TestViewController alloc]initWithNibName:@"TestViewController_ipad" bundle:[NSBundle mainBundle]];
            }
            else{
                testVC = [[TestViewController alloc]initWithNibName:@"TestViewController_iphone" bundle:[NSBundle mainBundle]];
            }
            [self presentModalViewController:testVC animated:YES];
        }
        else {
            NSLog(@"Chon bai khac");
            coursesViewController *coursesVC;
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
                coursesVC = [[coursesViewController alloc] initWithNibName:@"coursesViewController" bundle:[NSBundle mainBundle]];
            }
            else{
                coursesVC = [[coursesViewController alloc] initWithNibName:@"coursesViewController_iphone" bundle:[NSBundle mainBundle]];
            }
            [self presentModalViewController:coursesVC animated:YES];
        }
    }
}

@end
