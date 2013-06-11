//
//  myDatabaseList.h
//  ThayPhan
//
//  Created by Lion User on 13/08/2012.
//  Copyright (c) 2012 HUST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface myDatabaseList : NSObject{
    sqlite3 *db;
    NSMutableArray *dataArray;
    NSMutableDictionary *dataStored;
}

-(NSMutableArray *) getVietNamese;
-(NSMutableArray *) getJapanese;
-(NSMutableArray *) getEnglish;
-(NSMutableArray *) getChinese;

- (void) createEditableCopyOfDatabaseIfNeeded;

@end

