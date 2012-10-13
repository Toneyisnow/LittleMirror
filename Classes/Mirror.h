//
//  Mirror.h
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"
#import "Drawable.h"
#import "Ray.h"

/*
 
 Mirro Type Definition:
 
 0: Upright Mirror
 1: Lean Mirror
 2: Doubled Mirror
 3: Filter Mirror - Red
 4: Filter Mirror - Green
 5: Filter Mirror - Blue
 6: Through Mirror
 7: ChangeColor Mirror
 8: Split Mirror
 9: Spectro Mirror
 10: Teleporter
 11: Block
 */


@interface Mirror : Drawable {

	int mirrorType;
	int direction;
	BOOL movable;
}

-(id) initWithType:(int)type direction:(int)d;

-(void) rotate:(BOOL)clockwise;
-(int) direction;

-(BOOL) isMovable;
-(void) setMovable:(BOOL)m;

-(NSMutableArray *) reflectedRays:(Ray *)ray;
-(void) reflectedByMirror0:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror1:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror2:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror3:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror4:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror5:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror6:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror7:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror8:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror9:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror10:(Ray *)ray toArray:(NSMutableArray *)rays;
-(void) reflectedByMirror11:(Ray *)ray toArray:(NSMutableArray *)rays;


@end
