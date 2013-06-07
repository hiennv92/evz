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
+(NSString *) GetStringForKey:(NSString *)key andChooseLanguages:(int) chooseLanguage;
@end
