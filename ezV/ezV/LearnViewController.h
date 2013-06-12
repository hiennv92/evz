//
//  LearnViewController.h
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearnViewController : UIViewController
- (IBAction)backAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *buttonBack;

@end
