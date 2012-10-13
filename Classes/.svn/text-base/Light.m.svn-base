//
//  Light.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "Light.h"
#import "SpriteStore.h"

@implementation Light

-(id) initWithColor:(int)c direction:(int)d {

	self = [super init];
	
	color = c;
	direction = d;
	
	return self;
}

-(int) direction {
	return direction;
}

-(int) color {
	return color;
}

-(CCSprite *) sprite {
	
	return [SpriteStore getLightSprite:color direction:direction];
}

@end
