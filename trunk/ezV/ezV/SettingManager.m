//
//  SettingManager.m
//  TrieuPhuMob2.0
//
//  Created by doduong on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingManager.h"

@implementation SettingManager

+(BOOL) GetMusicMode
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    return  [pref boolForKey:PREF_MUSIC_KEY];
}
+(void) SaveMusicMode:(BOOL) isMusicOff
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    [pref setBool:isMusicOff forKey:PREF_MUSIC_KEY];
    [pref synchronize];
}
+(BOOL) GetAllowRememberAccountPermition
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    return [pref boolForKey:PREF_REMEMBER_KEY];
}
+(void) SaveAllowRememberAccuntPermittion:(BOOL) allowRememberAccount
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    [pref setBool:allowRememberAccount forKey:PREF_REMEMBER_KEY];
    [pref synchronize];
}
+(NSString *) GetUserID
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    NSMutableData *data = [pref objectForKey:PREF_USER_ID_KEY];
    NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    NSString *userID = (NSString *)[decoder decodeObjectForKey:PREF_USER_ID_PASS];
    return  userID;
    
}
+(void) SaveUserID:(NSString *)userID
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *encoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [encoder encodeObject:userID forKey:PREF_USER_ID_PASS];
    [encoder finishEncoding];
    [pref setObject:data forKey:PREF_USER_ID_KEY];
    [pref synchronize];
}
+(NSString *) GetUserPass
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    NSMutableData *data = [pref objectForKey:PREF_USER_PASS_KEY];
    NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    NSString *userPass = (NSString *)[decoder decodeObjectForKey:PREF_USER_PASS_PASS];
    return  userPass;
}
+(void) SaveUserPass:(NSString *)userPass
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *encoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [encoder encodeObject:userPass forKey:PREF_USER_PASS_PASS];
    [encoder finishEncoding];
    [pref setObject:data forKey:PREF_USER_PASS_KEY];
    [pref synchronize];
    
}
+(void) SaveVersion
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    NSString *ver = PREF_VERSION_VALUE;
    [pref setObject:ver forKey:PREF_VERSION_KEY];
}
+(NSString *) GetVersion
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:PREF_VERSION_KEY];
}
@end
