//
//  Laser.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "Laser.h"
#import "SpriteStore.h"

@implementation Laser

-(id) initWithType:(int)type direction:(int)d {

	self = [super init];
	color = type;
	direction = d;
	drawableType = [[DrawableType alloc] initWithItem:2 type:type subType:d];
	changed = TRUE;
	itemId = -1;
	
	return self;
}

-(CCSprite *) sprite {
	
	return [SpriteStore getLaserSprite:0 direction:direction];
}

-(int) direction {
	return direction;
}

-(int) color {
	return color;
}

@end
