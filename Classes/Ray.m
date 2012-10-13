//
//  Ray.m
//  PadTest
//
//  Created by sui toney on 11-7-7.
//  Copyright 2011 ms. All rights reserved.
//

#import "Ray.h"


@implementation Ray

-(id) initWithColor:(int)c direction:(int)d visible:(BOOL)v {

	self = [super init];
	
	color = c;
	direction = d;
	visible = v;
	
	return self;
}

-(int) color {

	return color;
}

-(int) direction {

	return direction;
}

-(BOOL) isVisible {

	return visible;
}

-(Ray *) clone {

	Ray *ray = [[Ray alloc] initWithColor:color	direction:direction visible:visible];
	return [ray autorelease];
}

-(Ray *) goStraightRay {

	Ray *ray = [[Ray alloc] initWithColor:color direction:(direction+4)%8 visible:visible];
	return [ray autorelease];
}

@end
