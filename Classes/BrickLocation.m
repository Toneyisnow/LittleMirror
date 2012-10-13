//
//  BrickLocation.m
//  PadTest
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "BrickLocation.h"


@implementation BrickLocation

-(id) initWithPanel:(int)p X:(int)x Y:(int)y {

	self = [super init];
	panel = p;
	posX = x;
	posY = y;
	return self;
}

+(id) mainPanelX:(int)x Y:(int)y {

	BrickLocation * location = [[self alloc] initWithPanel:0 X:x Y:y];
	return [location autorelease];
}

+(id) mirrorPanelX:(int)x Y:(int)y {

	BrickLocation * location = [[self alloc] initWithPanel:1 X:x Y:y];
	return [location autorelease];
}

-(int) panel {
	return panel;
}

-(int) posX {
	return posX;
}

-(int) posY {
	return posY;
}

@end
