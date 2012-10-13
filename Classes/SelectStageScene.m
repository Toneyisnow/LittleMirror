//
//  SelectStageScene.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "SelectStageScene.h"
#import "GameScene.h"

@implementation SelectStageScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SelectStageScene *layer = [SelectStageScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init] )) {
		
		// self.isTouchEnabled = YES;
		
		[CCMenuItemFont setFontSize:35];
		
		CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: @"Stage 1" target:self selector:@selector(onEnterGame)];
		CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: @"Stage 2" target:self selector:@selector(onEnter2)];
		CCMenuItemFont *item3 = [CCMenuItemFont itemFromString: @"Stage 3" target:self selector:@selector(onEnter3)];
		
		CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, nil];
		[menu alignItemsVerticallyWithPadding:10];
		CGSize size = [[CCDirector sharedDirector] winSize];
		menu.position = ccp(size.width/2, size.height /4);
		
		[self addChild: menu];
		
	}
	return self;
}

-(void) onEnterGame {

	NSLog(@"OnEnterGame");
	
	CCScene *scene = [GameScene scene: 1];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
}

-(void) onEnter2 {
}

-(void) onEnter3 {
}

@end
