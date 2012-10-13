//
//  Flower.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "Flower.h"
#import "SpriteStore.h"

@implementation Flower

-(CCSprite *) sprite {
	
	return [SpriteStore getFlowerSprite:color status:isLightOn];
}

-(id) initWithType:(int)type {
	
	self = [super init];
	//color = [Color color:type];
	color = type;
	isLightOn = FALSE;
	drawableType = [[DrawableType alloc] initWithItem:1 type:type subType:0];
	changed = TRUE;
	itemId = -1;
	
	return self;
}

-(void) setLightOn:(BOOL) isOn {
	
	if (isLightOn != isOn) {
		changed = TRUE;
	}
	isLightOn = isOn;
}
		
-(BOOL) isLightOn {

	return isLightOn;
}

-(int) color {
	return color;
}

@end
