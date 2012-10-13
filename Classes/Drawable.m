//
//  Drawable.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "Drawable.h"


@implementation Drawable

-(id) init {

	self = [super init];
	changed = TRUE;
	itemId = -1;
	return self;
}

-(CCSprite *) sprite {

	// Abstract method
	return nil;
}

-(int) itemId {
	return itemId;
}

-(void) setItemId:(int)i {
	itemId = i;
}

-(DrawableType *) drawableType {

	return drawableType;
}

-(void) drawOnScreen:(CCLayer *)screen atPosition:(CGPoint)position {

	if (screen == nil || !changed) {
		return;
	}
	
	// If sprite is not nil, remove it first
	if (sprite != nil) {
		[self removeFromScreen];
 	}
	
	sprite = [self sprite];
	[screen addChild:sprite];
	sprite.position = position;
	
	changed = FALSE;
}

-(void) removeFromScreen {

	if (sprite == nil || sprite.parent == nil) {
		return;
	}
	
	[sprite removeFromParentAndCleanup:TRUE];
}

-(void) dealloc {

	if (sprite != nil) {
		[sprite removeFromParentAndCleanup:YES];
	}
	[super dealloc];
}

@end
