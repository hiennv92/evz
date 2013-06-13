//
//  LearnViewController.h
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestViewController.h"
#import "coursesViewController.h"
#import "coursesViewController.h"
#import "MenuView.h"

@interface LearnViewController : UIViewController{
    //TEST CHUC NANG NEXT KHI HET BAI.
    int countTest;
    
}
- (IBAction)backAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonBack;

@property (strong, nonatomic) IBOutlet UILabel *labelLesson;
@property (strong, nonatomic) IBOutlet UILabel *labelWord;
@property (strong, nonatomic) IBOutlet UILabel *labelMean;
@property (strong, nonatomic) IBOutlet UIView *imageView;

- (IBAction)buttonSound:(id)sender;
- (IBAction)buttonNext:(id)sender;
@end
