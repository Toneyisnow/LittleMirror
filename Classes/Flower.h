//
//  Flower.h
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"
#import "Drawable.h"

@interface Flower : Drawable {

	//Color *color;
	int color;
	
	BOOL isLightOn;
}

-(id) initWithType:(int)type;
-(void) setLightOn:(BOOL) isOn;
-(BOOL) isLightOn;

-(int) color;


@end
