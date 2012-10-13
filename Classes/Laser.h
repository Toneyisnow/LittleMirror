//
//  Laser.h
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

// #import "cocos2d.h"
#import "Drawable.h"

@interface Laser : Drawable {

	int direction;
	int color;
}

-(id) initWithType:(int)type direction:(int)d;

-(int) direction;
-(int) color;
@end
