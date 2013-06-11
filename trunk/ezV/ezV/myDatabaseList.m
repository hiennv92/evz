//
//  myDatabaseList.m
//  ThayPhan
//
//  Created by Lion User on 13/08/2012.
//  Copyright (c) 2012 HUST. All rights reserved.
//

#import "myDatabaseList.h"
#import "databaseList.h"  
@implementation myDatabaseList

//Lay danh sach cac khoan thu
- (NSMutableArray *) getVietNamese{
    [self createEditableCopyOfDatabaseIfNeeded];
    sqlite3_stmt *sqlStatement = nil;
    
    NSMutableArray *languageArray = [[NSMutableArray alloc] init];
    @try {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"DataLanguages.sqlite"];
        
        if (sqlite3_open([path UTF8String], &db) == SQLITE_OK) {
            //Khai bao lay du lieu tu bang cac khoan thu
            const char *sql = "SELECT idLang, VietNamese FROM Languages";
            //NSString *sql = [NSString stringWithFormat:@"SELECT * FROM tblNenKy"];
            if(sqlite3_prepare_v2(db, sql , -1, &sqlStatement, NULL) != SQLITE_OK)
            {
                NSLog(@"Problem with prepare statement 1");
                NSLog(@"%s SQL error '%s' (%1d)",__FUNCTION__,sqlite3_errmsg(db),sqlite3_errcode(db));
            }

            //Lay du lieu tu bang cac bang
            while (sqlite3_step(sqlStatement)==SQLITE_ROW){
                databaseList *myLanguage = [[databaseList alloc]init];
                //Lay dy lieu tu bang tblNenKy
                myLanguage.idLang = sqlite3_column_int(sqlStatement, 0);
                myLanguage.language = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
                [languageArray addObject:myLanguage];
            }
            sqlite3_finalize(sqlStatement);
        }
        sqlite3_close(db);
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        return languageArray;
    }
}

-(NSMutableArray *)getJapanese{
    [self createEditableCopyOfDatabaseIfNeeded];
    sqlite3_stmt *sqlStatement = nil;
    
    NSMutableArray *languageArray = [[NSMutableArray alloc] init];
    @try {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"DataLanguages.sqlite"];
        
        if (sqlite3_open([path UTF8String], &db) == SQLITE_OK) {
            //Khai bao lay du lieu tu bang cac khoan thu
            const char *sql = "SELECT idLang, Japanese FROM Languages";
            //NSString *sql = [NSString stringWithFormat:@"SELECT * FROM tblNenKy"];
            if(sqlite3_prepare_v2(db, sql , -1, &sqlStatement, NULL) != SQLITE_OK)
            {
                NSLog(@"Problem with prepare statement 1");
                NSLog(@"%s SQL error '%s' (%1d)",__FUNCTION__,sqlite3_errmsg(db),sqlite3_errcode(db));
            }
            
            //Lay du lieu tu bang cac bang
            while (sqlite3_step(sqlStatement)==SQLITE_ROW){
                databaseList *myLanguage = [[databaseList alloc]init];
                //Lay dy lieu tu bang tblNenKy
                myLanguage.idLang = sqlite3_column_int(sqlStatement, 0);
                myLanguage.language = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
                [languageArray addObject:myLanguage];
            }
            sqlite3_finalize(sqlStatement);
        }
        sqlite3_close(db);
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        return languageArray;
    }
}

-(NSMutableArray *)getEnglish{
    [self createEditableCopyOfDatabaseIfNeeded];
    sqlite3_stmt *sqlStatement = nil;
    
    NSMutableArray *languageArray = [[NSMutableArray alloc] init];
    @try {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"DataLanguages.sqlite"];
        
        if (sqlite3_open([path UTF8String], &db) == SQLITE_OK) {
            //Khai bao lay du lieu tu bang cac khoan thu
            const char *sql = "SELECT idLang, English FROM Languages";
            //NSString *sql = [NSString stringWithFormat:@"SELECT * FROM tblNenKy"];
            if(sqlite3_prepare_v2(db, sql , -1, &sqlStatement, NULL) != SQLITE_OK)
            {
                NSLog(@"Problem with prepare statement 1");
                NSLog(@"%s SQL error '%s' (%1d)",__FUNCTION__,sqlite3_errmsg(db),sqlite3_errcode(db));
            }
            
            //Lay du lieu tu bang cac bang
            while (sqlite3_step(sqlStatement)==SQLITE_ROW){
                databaseList *myLanguage = [[databaseList alloc]init];
                //Lay dy lieu tu bang tblNenKy
                myLanguage.idLang = sqlite3_column_int(sqlStatement, 0);
                myLanguage.language = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
                [languageArray addObject:myLanguage];
            }
            sqlite3_finalize(sqlStatement);
        }
        sqlite3_close(db);
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        return languageArray;
    }
}

-(NSMutableArray *)getChinese{
    [self createEditableCopyOfDatabaseIfNeeded];
    sqlite3_stmt *sqlStatement = nil;
    
    NSMutableArray *languageArray = [[NSMutableArray alloc] init];
    @try {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"DataLanguages.sqlite"];
        
        if (sqlite3_open([path UTF8String], &db) == SQLITE_OK) {
            //Khai bao lay du lieu tu bang cac khoan thu
            const char *sql = "SELECT idLang, Chinese FROM Languages";
            //NSString *sql = [NSString stringWithFormat:@"SELECT * FROM tblNenKy"];
            if(sqlite3_prepare_v2(db, sql , -1, &sqlStatement, NULL) != SQLITE_OK)
            {
                NSLog(@"Problem with prepare statement 1");
                NSLog(@"%s SQL error '%s' (%1d)",__FUNCTION__,sqlite3_errmsg(db),sqlite3_errcode(db));
            }
            
            //Lay du lieu tu bang cac bang
            while (sqlite3_step(sqlStatement)==SQLITE_ROW){
                databaseList *myLanguage = [[databaseList alloc]init];
                //Lay dy lieu tu bang tblNenKy
                myLanguage.idLang = sqlite3_column_int(sqlStatement, 0);
                myLanguage.language= [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement,1)];
                [languageArray addObject:myLanguage];
            }
            sqlite3_finalize(sqlStatement);
        }
        sqlite3_close(db);
    }
    @catch (NSException *exception) {
        NSLog(@"An exception occured: %@", [exception reason]);
    }
    @finally {
        return languageArray;
    }
}

- (void) createEditableCopyOfDatabaseIfNeeded
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"DataLanguages.sqlite"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"DataLanguages.sqlite"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}


@end
