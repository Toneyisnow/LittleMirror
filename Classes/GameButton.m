//
//  GameButton.m
//  LittleMirror
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "GameButton.h"
#import "SpriteStore.h"

@implementation GameButton

-(id) initWithId:(int)bid position:(CGPoint)pos target:(id)t action:(SEL)action {

	self = [super initWithPosition:pos target:t action:action];
	
	buttonId = bid;
	
	return self;
}


@end
