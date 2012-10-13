//
//  DBConnection.m
//  PadTest
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "DBManager.h"
#import "Common.h"

static DBManager *sharedManager = nil;

@implementation DBManager


+(id) sharedManager {

	@synchronized(self)
	{
		if (sharedManager == nil) 
			sharedManager = [[self alloc] init]; 
	}
	return sharedManager;
}

-(id) init {

	self  = [super init];
	
	// databasePath = [[NSBundle mainBundle] pathForResource:@"game" ofType:@"db"];
	databasePath = [NSString stringWithFormat:@"%@/game.db", [Common GetDocumentDir]];
	
	database = nil;
	
    return self;
}

-(void) connectDB {

	if (database == nil) {
		if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {                 
			NSLog(@"Connected to database.");
		}	
	}
}

-(sqlite3_stmt *) query:(NSString *)queryString {

	[self connectDB];
	
	sqlite3_stmt *compiledStatement;                 
	if(sqlite3_prepare_v2(database, [queryString UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) 
	{
		NSLog(@"Query [%@] Successfully Executed.", queryString);
		return compiledStatement;
	} else {
		
		sqlite3_finalize(compiledStatement);
		//[self closeDB];
		return nil;
	}

}

-(void) execute:(NSString *)queryString {

	[self connectDB];
	
	char *errorMsg;
	
	NSLog(@"Executing query string: %@", queryString);
	
	if (sqlite3_exec(database,[queryString UTF8String] , NULL, NULL, &errorMsg) != SQLITE_OK) {
		NSString *errorMessage = [NSString stringWithFormat:@"Failed to execute SQL '%@' with message '%s'.", queryString, errorMsg];
		NSLog(@"%@", errorMessage);
		
		NSAssert(0, errorMessage);
		sqlite3_free(errorMsg);
	}
	
	// [self closeDB];
}

-(BOOL) exists:(NSString *)queryString {
	
	[self connectDB];
	
	NSLog(@"Executing query string: %@", queryString);
	
	BOOL result = FALSE;
	sqlite3_stmt *statement;
	if (sqlite3_prepare_v2( database, [queryString UTF8String], -1, &statement, NULL) == SQLITE_OK)
	{
		if (sqlite3_step(statement) == SQLITE_ROW)
		{
			result = TRUE;
		}
	}
	
	// [self closeDB];
	return result;
}

-(void) closeDB {
	
	if (database != nil) {
		sqlite3_close(database);
		database = nil;
	
		NSLog(@"Closed DB Connection.");
	}
}

-(void) dealloc {

	[self closeDB];
	[super dealloc];
}

/*
-(void) getDatabase {

	// NSString *databasePath = @"./game.db";
	NSString *databasePath = [[NSBundle mainBundle] pathForResource:@"game" ofType:@"db"];
    
	sqlite3 *database;         
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {                 
		
		NSLog(@"Setup the SQL Statement and compile it for faster access");
		
		const char *sqlStatement = "select * from Stage;";                 
		sqlite3_stmt *compiledStatement;                 
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) 
		{
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				NSString *idstr = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSString *statusstr = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				int stageid = [idstr intValue];
				int status  = [statusstr intValue];
				
				NSLog(@"StageId: %d Status: %d", stageid, status);
			}                 
		}
		sqlite3_finalize(compiledStatement);
	}         
	sqlite3_close(database);
}
*/

@end
