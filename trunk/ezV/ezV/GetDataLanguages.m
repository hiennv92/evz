//
//  GetDataLanguages.m
//  ezV
//
//  Created by Duong on 6/7/13.
//  Copyright (c) 2013 ezV. All rights reserved.
//

#import "GetDataLanguages.h"

@implementation GetDataLanguages

static NSDictionary *dataLanguageDictionary;

+(NSString *) GetStringForKey:(NSString *)key andChooseLanguages:(int) chooseLanguage
{
    NSString *result;
    if(dataLanguageDictionary == nil)
    {
        if(chooseLanguage == 1){
            dataLanguageDictionary = [[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DataLanguages" ofType:@"plist"]] objectForKey:@"English"];
        }
        else if(chooseLanguage == 2){
             dataLanguageDictionary = [[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DataLanguages" ofType:@"plist"]] objectForKey:@"Chinese"];
        }
        else if(chooseLanguage == 3){
             dataLanguageDictionary = [[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DataLanguages" ofType:@"plist"]] objectForKey:@"Japanese"];
        }
        else{
             dataLanguageDictionary = [[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DataLanguages" ofType:@"plist"]] objectForKey:@"VietNamese"];
        }
        
    }
    result =[dataLanguageDictionary objectForKey:key];
    return result;
}

@end
