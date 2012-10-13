//
//  Mirror.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "Mirror.h"
#import "SpriteStore.h"

@implementation Mirror

-(id) initWithType:(int)type direction:(int)d {

	self = [super init];
	
	drawableType = [[DrawableType alloc] initWithItem:0 type:type subType:d];
	mirrorType = type;
	direction = d;
	changed = TRUE;
	itemId = -1;
	movable = TRUE;
	
	return self;
}

-(CCSprite *) sprite {
	
	return [SpriteStore getMirrorSprite:mirrorType direction:direction];
}

-(BOOL) isMovable {
	return movable;
}

-(void) setMovable:(BOOL)m {
	movable = m;
}

-(void) rotate:(BOOL)clockwise {

	int val = (clockwise ? 1 : -1);
	direction = (direction + val + 8) % 8;
	[drawableType changeSubtype:direction];
	
	changed = TRUE;
}

-(NSMutableArray *) reflectedRays:(Ray *)ray {

	NSMutableArray *rays = [[NSMutableArray alloc] init];
	
	if (ray == nil) {
		return rays;
	}
	
	switch (mirrorType) {
		case 0:
			[self reflectedByMirror0:ray toArray:rays];
			break;
		case 1:
			[self reflectedByMirror1:ray toArray:rays];
			break;
		case 2:
			[self reflectedByMirror2:ray toArray:rays];
			break;
		case 3:
			[self reflectedByMirror3:ray toArray:rays];
			break;
		case 4:
			[self reflectedByMirror4:ray toArray:rays];
			break;
		case 5:
			[self reflectedByMirror5:ray toArray:rays];
			break;
		case 6:
			[self reflectedByMirror6:ray toArray:rays];
			break;
		case 7:
			[self reflectedByMirror7:ray toArray:rays];
			break;
		case 8:
			[self reflectedByMirror8:ray toArray:rays];
			break;
		case 9:
			[self reflectedByMirror9:ray toArray:rays];
			break;
		case 10:
			[self reflectedByMirror10:ray toArray:rays];
			break;
		case 11:
			[self reflectedByMirror11:ray toArray:rays];
			break;
		default:
			break;
	}
	
	return [rays autorelease];
}

// Upright Mirror
-(void) reflectedByMirror0:(Ray *)ray toArray:(NSMutableArray *)rays {

	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction) {
		[rays addObject:[ray clone]];
		
	} else if ([ray direction] == (direction + 1) % 8) {
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:(direction+7)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
	} else if ([ray direction] == (direction + 7) % 8) {
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:(direction+1)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];	
	}
}

// Lean Mirror
-(void) reflectedByMirror1:(Ray *)ray toArray:(NSMutableArray *)rays {
	
	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction) {
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:(direction+1)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
	} else if ([ray direction] == (direction + 1) % 8) {
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:(direction)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
	} else if ([ray direction] == (direction + 2) % 8) {
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:(direction+7)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
	} else if ([ray direction] == (direction + 7) % 8) {
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:(direction+2)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
	}
}

// Doubled Mirror
-(void) reflectedByMirror2:(Ray *)ray toArray:(NSMutableArray *)rays {

	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction || [ray direction] == (direction+4)%8) {
		[rays addObject:[ray clone]];
		
	} else if ([ray direction] == (direction+1)%8 || [ray direction] == (direction+5)%8) {
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:([ray direction]+6)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
	} else if ([ray direction] == (direction+7)%8 || [ray direction] == (direction+3)%8) {
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:([ray direction]+2)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];	
	}
	
	if ([ray direction] != (direction+6)%8 && [ray direction] != (direction+2)%8) {
		[rays addObject:[ray goStraightRay]];
	}
}

// Filter Mirror - Red
-(void) reflectedByMirror3:(Ray *)ray toArray:(NSMutableArray *)rays {

	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction || [ray direction] == (direction+4)%8) {
		if ((1 & [ray color]) != 0) {
			Ray *r = [[Ray alloc] initWithColor:1 direction:([ray direction]+4)%8 visible:[ray isVisible]];
			[rays addObject:[r autorelease]];
		}
	}	
}

// Filter Mirror - Green
-(void) reflectedByMirror4:(Ray *)ray toArray:(NSMutableArray *)rays {

	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction || [ray direction] == (direction+4)%8) {
		if ((2 & [ray color]) != 0) {
			Ray *r = [[Ray alloc] initWithColor:2 direction:([ray direction]+4)%8 visible:[ray isVisible]];
			[rays addObject:[r autorelease]];
		}
	}	
}

// Filter Mirror - Blue
-(void) reflectedByMirror5:(Ray *)ray toArray:(NSMutableArray *)rays {
	
	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction || [ray direction] == (direction+4)%8) {
		if ((4 & [ray color]) != 0) {
			Ray *r = [[Ray alloc] initWithColor:4 direction:([ray direction]+4)%8 visible:[ray isVisible]];
			[rays addObject:[r autorelease]];
		}
	}	
}

// Through Mirror
-(void) reflectedByMirror6:(Ray *)ray toArray:(NSMutableArray *)rays {

	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction || [ray direction] == (direction+4)%8) {
		[rays addObject:[ray goStraightRay]];
	}
}

// Change Color Mirror
-(void) reflectedByMirror7:(Ray *)ray toArray:(NSMutableArray *)rays {

	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction || [ray direction] == (direction+4)%8) {
		
		int red = 1 & [ray color];
		int green = 2 & [ray color];
		int blue = 4 & [ray color];
		int newColor = red * 2 + green * 2 + blue / 4;
		
		Ray *r = [[Ray alloc] initWithColor:newColor direction:([ray direction]+4)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
	}
}

// Split Mirror
-(void) reflectedByMirror8:(Ray *)ray toArray:(NSMutableArray *)rays {

	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction) {
	
		Ray *r = [[Ray alloc] initWithColor:[ray color] direction:(direction+2)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
		r = [[Ray alloc] initWithColor:[ray color] direction:(direction+6)%8 visible:[ray isVisible]];
		[rays addObject:[r autorelease]];
	}
}

// Spectro Mirror
-(void) reflectedByMirror9:(Ray *)ray toArray:(NSMutableArray *)rays {
	
	if (![ray isVisible]) {
		[rays addObject:[ray goStraightRay]];
		return;
	}
	
	if ([ray direction] == direction) {
		
		if ((1 & [ray color]) != 0) {
			Ray *r = [[Ray alloc] initWithColor:1 direction:(direction+2)%8 visible:[ray isVisible]];
			[rays addObject:[r autorelease]];
		}
		if ((2 & [ray color]) != 0) {
			Ray *r = [[Ray alloc] initWithColor:2 direction:(direction+3)%8 visible:[ray isVisible]];
			[rays addObject:[r autorelease]];
		}
		if ((4 & [ray color]) != 0) {
			Ray *r = [[Ray alloc] initWithColor:4 direction:(direction+4)%8 visible:[ray isVisible]];
			[rays addObject:[r autorelease]];
		}
	}
	
}

// Transporter Mirror
-(void) reflectedByMirror10:(Ray *)ray toArray:(NSMutableArray *)rays {
	
	Ray *r = [[Ray alloc] initWithColor:[ray color] direction:([ray direction]+4)%8 visible:![ray isVisible]];
	[rays addObject:[r autorelease]];
}

//Block
-(void) reflectedByMirror11:(Ray *)ray toArray:(NSMutableArray *)rays {

	return;
}

-(int) direction {
	return direction;
}
						
@end
