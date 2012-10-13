//
//  Clickable.m
//  LittleMirror
//
//  Created by sui toney on 11-7-21.
//  Copyright 2011 ms. All rights reserved.
//

#import "Clickable.h"
#import "SpriteStore.h"

@implementation Clickable

-(id) initWithPosition:(CGPoint)pos target:(id)t action:(SEL)action {

	self = [super init];
	
	position = pos;
	target = t;
	doAction = action;
	
	changed = TRUE;
	sprite = nil;
	
	return self;
}

-(BOOL) isClickedOn:(CGPoint)pos {
	
	if (sprite == nil) {
		return FALSE;
	}
	
	if (pos.x - sprite.position.x < sprite.textureRect.size.width/2 &&
		pos.x - sprite.position.x > -sprite.textureRect.size.width/2 &&
		pos.y - sprite.position.y < sprite.textureRect.size.height/2 &&
		pos.y - sprite.position.y > -sprite.textureRect.size.height/2)
	{
		[target performSelector:doAction];
		return TRUE;
		
	}
	
	return FALSE;
}

-(void) drawOnScreen:(CCLayer *)screen {
	
	if (screen == nil || !changed) {
		return;
	}
	
	// If sprite is not nil, remove it first
	if (sprite != nil) {
		[self removeFromScreen];
 	}
	
	sprite = [SpriteStore getFlowerSprite:1 status:TRUE];
	[screen addChild:sprite];
	sprite.position = position;
	
	changed = FALSE;
}

-(void) removeFromScreen {
	
	if (sprite == nil || sprite.parent == nil) {
		return;
	}
	
	NSLog(@"Removing from screen");
	[sprite removeFromParentAndCleanup:TRUE];
}

-(void) changeStatus:(int)newstatus {
	
	status = newstatus;
	changed = TRUE;
}

-(void) dealloc {
	
	if (sprite != nil) {
		if (sprite.parent != nil) {
			[sprite removeFromParentAndCleanup:TRUE];
		} else {
			[sprite release];
		}
	}
	
	[super dealloc];
}

@end
