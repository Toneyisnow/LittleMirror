//
//  HelloWorldLayer.m
//  PadTest
//
//  Created by sui toney on 11-7-3.
//  Copyright ms 2011. All rights reserved.
//

// Import the interfaces
#import "HomePageScene.h"
#import "SelectStageScene.h"
#import "GameScene.h"
#import "StageScene.h"
#import "LocalString.h"
//#import "DBConnection.h"

// HelloWorld implementation
@implementation HomePageScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HomePageScene *layer = [HomePageScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		[CCMenuItemFont setFontSize:35];
		
		CCMenuItemFont *item1 = [CCMenuItemFont itemFromString: [LocalString MainPageStart] target:self selector:@selector(onStart)];
		CCMenuItemFont *item2 = [CCMenuItemFont itemFromString: [LocalString MainPageTrohpy] target:self selector:@selector(onTrophy)];
		CCMenuItemFont *item3 = [CCMenuItemFont itemFromString: [LocalString MainPageSettings] target:self selector:@selector(onSettings)];
		
		CCMenu *menu = [CCMenu menuWithItems: item1, item2, item3, nil];
		[menu alignItemsVerticallyWithPadding:10];
		CGSize size = [[CCDirector sharedDirector] winSize];
		menu.position = ccp(size.width/2, size.height /4);
		
		[self addChild: menu];
		
		// Log the current Screen information
		NSLog(@"Width:%f Height:%f", size.width, size.height);
		
		//DBConnection *connection = [[DBConnection alloc] init];
		//[connection connect];
	}
	return self;
}

-(void) onStart {
	
	CCScene *scene = [SelectStageScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
}

-(void) onTrophy {
	
}

-(void) onSettings {
	
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
