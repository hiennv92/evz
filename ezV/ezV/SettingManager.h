//
//  SettingManager.h
//  TrieuPhuMob2.0
//
//  Created by doduong on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PREF_MUSIC_KEY @"musicMode"
#define PREF_REMEMBER_KEY @"allowRememberAcc"
#define PREF_USER_ID_KEY @"userID"
#define PREF_USER_PASS_KEY @"userPass"
#define PREF_USER_ID_PASS @"dodd@snvn"
#define PREF_USER_PASS_PASS @"thuttm@mnvn"
#define PREF_VERSION_KEY @"version"
#define PREF_VERSION_VALUE @"2.0.0_25092012"

@interface SettingManager : NSObject

+(BOOL) GetMusicMode;
+(void) SaveMusicMode:(BOOL) isMusicOff;
+(BOOL) GetAllowRememberAccountPermition;
+(void) SaveAllowRememberAccuntPermittion:(BOOL) allowRememberAccount;
+(NSString *) GetUserID;
+(void) SaveUserID:(NSString *)userID;
+(NSString *) GetUserPass;
+(void) SaveUserPass:(NSString *)userPass;
+(void) SaveVersion;
+(NSString *)GetVersion;
@end
