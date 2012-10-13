//
//  Drawable.h
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"
#import "DrawableType.h"

@interface Drawable : NSObject {

	int itemId;
	DrawableType *drawableType;
	CCSprite *sprite;
	BOOL changed;
}

-(CCSprite *) sprite;
-(DrawableType *) drawableType;
-(void) drawOnScreen:(CCLayer *)screen atPosition:(CGPoint)pos;
-(void) removeFromScreen;

-(int) itemId;
-(void) setItemId:(int)i;

@end
