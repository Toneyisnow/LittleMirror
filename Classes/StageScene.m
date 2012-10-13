//
//  StageScene.m
//  PadTest
//
//  Created by sui toney on 11-7-6.
//  Copyright 2011 ms. All rights reserved.
//

#import "StageScene.h"
#import "GameScene.h"
#import "SpriteStore.h"

@implementation StageScene

+(id) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StageScene *layer = [StageScene node];
	
	[layer loadPage:0];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if ((self=[super init])) {
		
		NSLog(@"Load StageScene.");
	}
	return self;
}

-(void) loadPage:(int)page {

	pageId = page;
	
	int startX = 100;
	int startY = 100;
	int intervalX = 200;
	int intervalY = 180;
	
	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 4; j++) {
			CCSprite *stage = [SpriteStore getStageSprite:(i+j*5) status:0];
			stage.position = ccp(startX + i * intervalX, startY + j * intervalY);
			[self addChild:stage];
		}
	}
	
	/*
	CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: @"Stage 1" target:self selector:@selector(onStart1)];
	CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: @"Stage 2" target:self selector:@selector(onStart2)];
	CCMenuItemFont *item3 = [CCMenuItemFont itemFromString: @"Stage 3" target:self selector:@selector(onStart3)];
	
	CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, nil];
	[menu alignItemsVerticallyWithPadding:10];
	CGSize size = [[CCDirector sharedDirector] winSize];
	menu.position = ccp(size.width/2, size.height /4);
	
	[self addChild: menu];
	*/
}

- (void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	
	NSLog(@"Clicked");
	
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];

	
}

-(void) onStart1 {
	
	NSLog(@"OnStart");
	
	CCScene *scene = [GameScene scene: 1];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];	
}
-(void) onStart2 {
	
	NSLog(@"OnStart");
	
	CCScene *scene = [GameScene scene: 2];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];	
}
-(void) onStart3 {
	
	NSLog(@"OnStart");
	
	CCScene *scene = [GameScene scene: 3];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];	
}

-(void) dealloc {
	
	[super dealloc];
}

@end
