//
//  databaseList.h
//  ThayPhan
//
//  Created by Lion User on 13/08/2012.
//  Copyright (c) 2012 HUST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface databaseList : NSObject{
    NSInteger idLang;
    NSString *language;
}

@property(nonatomic, assign)NSInteger idLang;
@property(nonatomic, retain)NSString *language;
    
@end
