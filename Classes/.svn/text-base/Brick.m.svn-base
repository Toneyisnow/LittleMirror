//
//  Brick.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "Brick.h"
#import "GameConfig.h"

@implementation Brick

-(id) initWithLocation:(BrickLocation *)loc {

	self = [super init];
	
	location = [loc retain];
	int i = [loc posX];
	int j = [loc posY];
	
	if ([loc panel] == 0) {
		position = CGPointMake(GAME_PANEL_LEFT + (i + 0.5) * BRICK_SIZE, GAME_PANEL_BUTTOM + (j + 0.5) * BRICK_SIZE);
	} else if ([loc panel] == 1) {
		position = CGPointMake(MIRROR_PANEL_LEFT + (i + 0.5) * BRICK_SIZE, MIRROR_PANEL_BUTTOM + (j + 0.5) * BRICK_SIZE);
	}

	inputRay = [[NSMutableDictionary alloc] init];
	allRay = [[NSMutableArray alloc] init];
	
	for (int i = 0; i < 8; i++) {
		relatedBrick[i] = nil;
		lights[i] = nil;
	}
	
	return self;
}

-(void) setRelatedBrick:(Brick *)brick AtIndex:(int)index {

	relatedBrick[index] = brick;
}

-(void) setFlower:(Flower *)f {

	if ([self isOccupied]) {
		return;
	}
	flower = [f retain];
}

-(void) setLaser:(Laser *)l {

	if ([self isOccupied]) {
		return;
	}
	laser = [l retain];
}

-(void) setMirror:(Mirror *)m {
	
	if ([self isOccupied]) {
		return;
	}
	mirror = [m retain];
}

-(void) setItem:(Drawable *)d {
	
	if ([d isKindOfClass:[Mirror class]]) {
		[self setMirror:(Mirror *)d];
	}
	if ([d isKindOfClass:[Flower class]]) {
		[self setFlower:(Flower *)d];
	}
	if ([d isKindOfClass:[Laser class]]) {
		[self setLaser:(Laser *)d];
	}
}

-(Mirror *) getMirror {
	return mirror;
}

-(Laser *) getLaser {
	return laser;
}

-(Flower *) getFlower {
	return flower;
}

-(BrickLocation *) location {
	return location;
}

-(int) getItemId {

	if (mirror != nil) {
		return [mirror itemId];
	}
	if (flower != nil) {
		return [flower itemId];
	}
	if (laser != nil) {
		return [laser itemId];
	}
	return -1;
}

-(void) addRay:(Ray *)ray {
	
	NSString *key = [NSString stringWithFormat:@"%d-%d-%b", [ray color], [ray direction], [ray isVisible]];
	// NSLog(@"Add Ray with Key: %@", key);
	
	if ([inputRay objectForKey:key] != nil) {
		return;
	}
	
	[allRay addObject:ray];
	[inputRay setObject:ray forKey:key];
	[self handleRay:ray];
}

-(void) handleRay:(Ray *)ray {

	if (laser != nil && [ray isVisible]) {
		return;
	}
	
	NSMutableArray *rays;
	if (mirror != nil) {
		rays = [mirror reflectedRays:ray];
	} else {
		// Add a through ray
		rays = [self throughRays:ray];
	}
	
	for (int i = 0; i < [rays count]; i++) {
		[allRay addObject:[rays objectAtIndex:i]];
		[self sendOutRay:[rays objectAtIndex:i]];
	}
}

-(NSMutableArray *) throughRays:(Ray *)ray {

	NSMutableArray *rays = [[NSMutableArray alloc] init];
	[rays addObject:[ray goStraightRay]];
	
	return [rays autorelease];
}

-(void) turnOnRays {

	if (laser != nil) {
		
		// NSLog(@"Turn on ray in laser");
		Ray *ray = [[Ray alloc] initWithColor:[laser color] direction:[laser direction] visible:TRUE];
		
		[allRay addObject:ray];
		[self sendOutRay:ray];
		
		[ray release];
	}
}

/*
-(void) addOutterRay:(Ray *)ray {

	NSString *key = [NSString stringWithFormat:@"%d-%b", [ray direction], [ray visible]];
	
	if ([outterRay objectForKey:key] != nil) {
		
		Ray *oldRay = [outterRay objectForKey:key];
		int added = [oldRay mergeColor:[ray color]];
		
		if (added > 0) {
			
			Ray *addedRay = [[Ray alloc] initWithColor:added direction:[oldRay direction] visible:[oldRay isVisible]];
			[self sendOutRay:addedRay];
		}
		
	} else {
		[outterRay setObject:ray forKey:key];
		[self sendOutRay:ray];
	}
}
*/


-(void) sendOutRay:(Ray *)ray {

	Brick *brick = relatedBrick[[ray direction]];
	if (brick == nil) {
		return;
	}
	
	Ray *nextRay = [[Ray alloc] initWithColor:[ray color] direction:([ray direction]+4)%8 visible:[ray isVisible]];
	[brick addRay:nextRay];
	[nextRay release];
}

-(void) clearRays {

	[allRay removeAllObjects];
	[inputRay removeAllObjects];
}

-(BOOL) isOccupied {
	
	return (flower != nil) || (mirror != nil) || (laser != nil);
}

-(BOOL) isMovable {
	
	return (mirror != nil) && [mirror isMovable];
}

-(BOOL) isInPosition:(CGPoint)point {

	return (point.x > position.x - BRICK_SIZE/2 && point.x < position.x + BRICK_SIZE/2)
		&& (point.y > position.y - BRICK_SIZE/2 && point.y < position.y + BRICK_SIZE/2);
}

-(void) updateFlowerState {

	if (flower == nil) {
		return;
	}
	
	int sumColor = 0;
	for (int i = 0; i < [allRay count]; i++) {
		
		Ray *ray = [allRay objectAtIndex:i];
		if ([ray isVisible]) {
			sumColor |= [ray color];
		}
	}
	
	BOOL isOn = ([flower color] == sumColor);
	[flower setLightOn:isOn];
}

-(BOOL) isWinning {

	if (flower == nil) {
		return TRUE;
	}
	
	return [flower isLightOn];
}

-(void) rotate:(BOOL)clockwise {
	
	if (mirror != nil && [mirror isMovable]) {
		
		NSLog(@"Rotated Mirror.");
		[mirror rotate: clockwise];
	}
}

-(void) drawOnScreen:(CCLayer *)screen {

	// NSLog(@"Ray count: %d", [allRay count]);
	
	// Draw the lights first 
	int color[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	
	for (int i = 0; i < [allRay count]; i++) {
		Ray *ray = [allRay objectAtIndex:i];
		if ([ray isVisible]) {
			color[[ray direction]] |= [ray color];
		}
	}
		
	for (int i = 0; i < 8; i++) {
		if (lights[i] != nil && [lights[i] color] == color[i]) {
			continue;
		}
		
		if (lights[i] != nil) {
			[lights[i] removeFromScreen];
		}
		
		if (color[i] > 0) {
			
			// NSLog(@"Draw light.");
			
			lights[i] = [[Light alloc] initWithColor:color[i] direction:i];
			[lights[i] drawOnScreen:screen atPosition:position];
		} else {
			lights[i] = nil;
		}
	}
	
	// And then draw the item
	if (mirror != nil) {
		[mirror drawOnScreen:screen atPosition:position];
	}
	if (flower != nil) {
		[flower drawOnScreen:screen atPosition:position];
	}
	if (laser != nil) {
		[laser drawOnScreen:screen atPosition:position];
	}
	
	// NSLog(@"Draw on screen finished");
}

-(DrawableType *) drawableType {

	if (mirror != nil) {
		return [mirror drawableType];
	}
	if (flower != nil) {
		return [flower drawableType];
	}
	if (laser != nil) {
		return [laser drawableType];
	}
	return nil;
}

-(int) rayCount {
	return [allRay count];
}

-(DrawableType *) picking {

	if (mirror == nil || ![mirror isMovable]) {
		return nil;
	}
	
	DrawableType *drawableType = [[mirror drawableType] retain];
	
	[mirror removeFromScreen];
	mirror = nil;
	
	return [drawableType autorelease];
}

-(void) pickedAway {
}

//-(void) pickedBack {
//}

-(void) put:(Mirror *)m {
	
	[self setMirror:m];
}

-(void) dealloc {

	[location release];
	
	if (mirror != nil) {
		[mirror release];
	}
	if (flower != nil) {
		[flower release];
	}
	if (laser != nil) {
		[laser release];
	}
	
	[super dealloc];
}

@end
