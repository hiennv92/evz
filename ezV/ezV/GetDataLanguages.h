//
//  GetDataLanguages.h
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetDataLanguages : NSObject

#define DATA_SETTING_KEY @"setting"
#define DATA_HELP_KEY @"help"
#define DATA_COURSE_KEY @"course"
#define DATA_TEST_KEY @"test"
#define DATA_LEARN_KEY @"learn"
#define DATA_LOGIN_KEY @"login"
#define DATA_REGISTER_KEY @"register"
#define DATA_PASS_KEY @"password"
#define DATA_USERNAME_KEY @"username"
#define DATA_TITLECANCEL_KEY @"titlebuttoncancel"
#define DATA_ALERTMENUMESS_KEY @"alertmenumess"
#define DATA_ALERTMENUTITLE_KEY @"titlealertmenu"
#define DATA_ALERTLOGINTITLE_KEY @"titlealertlogin"
#define DATA_ALERTLOGINMESS_KEY @"messalertlogin"
#define DATA_REMEMBERLABEL_KEY @"rememberlabel"

#define DATA_REGISTERVIEW_BUTTONDONE @"registerview_buttondone"
#define DATA_REGISTERVIEW_LABELNAME @"registerview_labelname"
#define DATA_REGISTERVIEW_LABELUSERNAME @"registerview_labelusername"
#define DATA_REGISTERVIEW_LABELPASS @"registerview_labelpass"
#define DATA_REGISTERVIEW_LABELREPASS @"registerview_labelrepass"
#define DATA_REGISTERVIEW_LABELEMAIL @"registerview_labelemail"
#define DATA_REGISTERVIEW_TITLE @"registerview_title"

+(NSString *) GetStringForKey:(NSString *)key andChooseLanguages:(int) chooseLanguage;
@end
