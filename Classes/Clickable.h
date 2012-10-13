//
//  Clickable.h
//  LittleMirror
//
//  Created by sui toney on 11-7-21.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"


@interface Clickable : NSObject {
	
	CGPoint position;
	int status;
	BOOL changed;
	
	SEL doAction;
	id target;
	
	CCSprite *sprite;
}

-(id) initWithPosition:(CGPoint)pos target:(id)t action:(SEL)action;

-(void) drawOnScreen:(CCLayer *)screen;
-(void) removeFromScreen;

-(BOOL) isClickedOn:(CGPoint)pos;

-(void) changeStatus:(int)newstatus;

@end
