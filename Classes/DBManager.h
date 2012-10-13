//
//  DBConnection.h
//  PadTest
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"
#import <sqlite3.h>

@interface DBManager : NSObject {

	NSString *databasePath;
	sqlite3 *database;
}

+(id) sharedManager;

-(void) connectDB;
-(void) closeDB;

-(sqlite3_stmt *) query:(NSString *)queryString;
-(void) execute:(NSString *)queryString;

-(BOOL) exists:(NSString *)queryString;

@end
