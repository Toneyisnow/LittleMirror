//
//  Light.h
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"
#import "Drawable.h"

@interface Light : Drawable {

	int direction;
	int color;
}

-(id) initWithColor:(int)c direction:(int)d;

-(int) direction;
-(int) color;

@end
