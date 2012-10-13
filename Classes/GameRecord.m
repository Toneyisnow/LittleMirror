//
//  GameRecord.m
//  PadTest
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "GameRecord.h"


@implementation GameRecord


-(id) initWithId:(int)i location:(BrickLocation *)loc drawableType:(DrawableType *)d {

	self = [super init];
	
	itemId = i;
	location = [loc retain];
	drawableType = [d retain];
	
	return self;
}

-(BrickLocation *) location {
	return location;
}

-(DrawableType *) drawableType {
	return drawableType;
}

-(int) itemId {
	return itemId;
}

-(void) dealloc {

	[drawableType release];
	[location release];
	
	[super dealloc];
}


@end
