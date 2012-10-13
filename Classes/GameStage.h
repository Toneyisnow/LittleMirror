//
//  Stage.h
//  PadTest
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "GameRecord.h"
#import "DBManager.h"

@interface GameStage : NSObject {

	DBManager *dbManager;
	int stageId;
}

-(id) initWithId:(int)i;

-(int) stageId;
-(int) getStatus;

-(void) update:(GameRecord *)record;
-(void) takeRecord;

-(void) clearAllRecord;

-(NSMutableArray *) loadAll;

-(NSString *) parse:(sqlite3_stmt *)statement column:(int)col;

// -(void) update:(int)itemId toLocation:(BrickLocation *)location withDrawableType:(DrawableType *)drawableType;

@end
