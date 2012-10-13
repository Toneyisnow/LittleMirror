//
//  Brick.h
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"
#import "Mirror.h"
#import "Laser.h"
#import "Flower.h"
#import "Light.h"
#import "Block.h"
#import "Ray.h"
#import "BrickLocation.h"

@interface Brick : NSObject {

	//CCLayer *parentScreen;
	
	CGPoint position;	// The pixel position for the sprites to draw
	BrickLocation *location;
	
	Brick *relatedBrick[8];
	
	Mirror *mirror;
	Laser *laser;
	Flower *flower;
	//Block *block;
	
	
	NSMutableDictionary *inputRay;
	NSMutableArray *allRay;
	
	Light *lights[8];
}

// -(id) initWithPosition:(CGPoint)pos;
-(id) initWithLocation:(BrickLocation *)loc;

-(void) setRelatedBrick:(Brick *)brick AtIndex:(int)index;

-(void) setFlower:(Flower *)f;
-(void) setLaser:(Laser *)l;
-(void) setMirror:(Mirror *)m;
-(void) setItem:(Drawable *)d;

//-(void) setBlock:(Block *)m;

-(void) addRay:(Ray *)ray;
-(void) sendOutRay:(Ray *)ray;
-(void) handleRay:(Ray *)ray;
-(NSMutableArray *) throughRays:(Ray *)ray;
-(void) clearRays;
-(void) turnOnRays;

-(DrawableType *) drawableType;
-(BrickLocation *) location;
-(int) getItemId;

-(int) rayCount;

-(void) updateFlowerState;
-(BOOL) isWinning;

-(Mirror *) getMirror;
-(Laser *) getLaser;
-(Flower *) getFlower;
//-(Block *) getBlock;

-(BOOL) isOccupied;
-(BOOL) isMovable;
-(void) rotate:(BOOL)clockwise;

-(BOOL) isInPosition:(CGPoint)point;

-(void) drawOnScreen:(CCLayer *)screen;

-(DrawableType *) picking;
-(void) pickedAway;
-(void) put:(Mirror *)mirror;

@end
