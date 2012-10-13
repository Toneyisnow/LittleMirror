//
//  GameScene.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "GameScene.h"
#import "SpriteStore.h"
#import "StageScene.h"

@implementation GameScene

+(id) scene:(int)stage {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	GameScene *layer = [GameScene node];
	[scene addChild: layer];
	
	layer.isTouchEnabled = TRUE;
	
	// Start
	[layer loadStage:stage];
	
	[layer response];
	
	
	// return the scene
	return scene;
}

-(id) init
{
	if ((self=[super init])) {
		
		selectedItemId = 0;
		selectedBrick = nil;
		
		NSLog(@"Load GameScene.");
		[self initPanel];
	}
	return self;
}

-(void) initPanel {

	// Init the sprites
	CCSprite *sprite = [CCSprite spriteWithFile:@"Background.png"];
	sprite.position = ccp(GAME_PANEL_LEFT + GAME_WIDTH * BRICK_SIZE / 2, GAME_PANEL_LEFT + GAME_HEIGHT * BRICK_SIZE / 2);
	[self addChild:sprite];
	
	CCSprite *sprite2 = [CCSprite spriteWithFile:@"Pad.png"];
	sprite2.position = ccp(MIRROR_PANEL_LEFT + MIRROR_WIDTH * BRICK_SIZE / 2, MIRROR_PANEL_BUTTOM + MIRROR_HEIGHT * BRICK_SIZE / 2);
	[self addChild:sprite2];
	
	// Initialize logical bricks
	for (int i = 0; i < GAME_WIDTH; i ++) {
		for (int j = 0; j < GAME_HEIGHT; j ++) {
			
			gamePanel[i][j] = [[Brick alloc] initWithLocation:[BrickLocation mainPanelX:i Y:j]];
		}
	}
	for (int i = 0; i < MIRROR_WIDTH; i ++) {
		for (int j = 0; j < MIRROR_HEIGHT; j ++) {
			
			mirrorsPanel[i][j] = [[Brick alloc] initWithLocation:[BrickLocation mirrorPanelX:i Y:j]];
		}
	}
	
	// Initialize related bricks
	for (int i = 0; i < GAME_WIDTH; i ++) {
		for (int j = 0; j < GAME_HEIGHT; j ++) {
			
			if (i > 0) {
				[gamePanel[i][j] setRelatedBrick:gamePanel[i-1][j] AtIndex:6];
			}
			if (i < GAME_WIDTH - 1) {
				[gamePanel[i][j] setRelatedBrick:gamePanel[i+1][j] AtIndex:2];
			}
			if (j > 0) {
				[gamePanel[i][j] setRelatedBrick:gamePanel[i][j-1] AtIndex:4];
			}
			if (j < GAME_HEIGHT - 1) {
				[gamePanel[i][j] setRelatedBrick:gamePanel[i][j+1] AtIndex:0];
			}
			if (i > 0 && j > 0) {
				[gamePanel[i][j] setRelatedBrick:gamePanel[i-1][j-1] AtIndex:5];
			}
			if (i < GAME_WIDTH - 1 && j > 0) {
				[gamePanel[i][j] setRelatedBrick:gamePanel[i+1][j-1] AtIndex:3];
			}
			if (i > 0 && j < GAME_HEIGHT - 1) {
				[gamePanel[i][j] setRelatedBrick:gamePanel[i-1][j+1] AtIndex:7];
			}
			if (i < GAME_WIDTH - 1 && j < GAME_HEIGHT - 1) {
				[gamePanel[i][j] setRelatedBrick:gamePanel[i+1][j+1] AtIndex:1];
			}
		}
	}
	
	// Init buttons
	//gameButtons = [[NSMutableArray alloc] init];
	
	previousButton = [[GameButton alloc] initWithId:1 position:CGPointMake(950, 0) target:self action:@selector(goToPreviousStage)];
	nextButton = [[GameButton alloc] initWithId:2 position:CGPointMake(950, 60) target:self action:@selector(goToNextStage)];
	resetButton = [[GameButton alloc] initWithId:3 position:CGPointMake(950, 120) target:self action:@selector(resetStage)];
	backButton = [[GameButton alloc] initWithId:4 position:CGPointMake(950, 180) target:self action:@selector(backToHomePage)];
	
	/*
	 [gameButtons addObject:previousButton];
	[gameButtons addObject:nextButton];
	[gameButtons addObject:resetButton];
	[gameButtons addObject:backButton];
	*/
	
	[previousButton drawOnScreen:self];
	[nextButton drawOnScreen:self];
	[resetButton drawOnScreen:self];
	[backButton drawOnScreen:self];
	
}

-(void) loadStage:(int)stage {

	gameStage = [[GameStage alloc] initWithId:stage];
	
	// Load the game definitions from SQLite
	NSMutableArray *records = [gameStage loadAll];
	
	for (int i = 0; i < [records count]; i++) {
		
		GameRecord *record = [records objectAtIndex:i];
		if (record == nil || [record itemId] < 0 || [record location] == nil || [record drawableType] == nil) {
			continue;
		}
		
		int itemId = [record itemId];
		BrickLocation *location = [record location];
		DrawableType *drawableType = [record drawableType];
		
		Drawable *drawable = nil;
		switch ([drawableType item]) {
			case 0:
				drawable = [[Mirror alloc] initWithType:[drawableType type] direction:[drawableType subtype]];
				break;
			case 1:
				drawable = [[Flower alloc] initWithType:[drawableType type]];
				break;
			case 2:
				drawable = [[Laser alloc] initWithType:[drawableType type] direction:[drawableType subtype]];
				break;
			default:
				return;
		}
		[drawable setItemId:itemId];
		
		Brick *brick = nil;
		switch ([location panel]) {
			case 0:
				brick = gamePanel[[location posX]][[location posY]];
				break;
			case 1:
				brick = mirrorsPanel[[location posX]][[location posY]];
				break;
			default:
				return;
		}
		[brick setItem:drawable];
		[drawable release];
	}
}

-(void) updateItems {

	for (int i = 0; i < GAME_WIDTH; i ++) {
		for (int j = 0; j < GAME_HEIGHT; j ++) {
			[gamePanel[i][j] clearRays];
		}
	}
	for (int i = 0; i < GAME_WIDTH; i ++) {
		for (int j = 0; j < GAME_HEIGHT; j ++) {
			[gamePanel[i][j] turnOnRays];
		}
	}
	for (int i = 0; i < GAME_WIDTH; i ++) {
		for (int j = 0; j < GAME_HEIGHT; j ++) {
			[gamePanel[i][j] updateFlowerState];
		}
	}
	
}

-(void) drawItems {
	
	for (int i = 0; i < GAME_WIDTH; i ++) {
		for (int j = 0; j < GAME_HEIGHT; j ++) {
			[gamePanel[i][j] drawOnScreen:self];
		}
	}
	for (int i = 0; i < MIRROR_WIDTH; i ++) {
		for (int j = 0; j < MIRROR_HEIGHT; j ++) {
			[mirrorsPanel[i][j] drawOnScreen:self];
		}
	}
}

-(void) checkWin {

	BOOL isWinning = TRUE;
	for (int i = 0; i < GAME_WIDTH; i ++) {
		for (int j = 0; j < GAME_HEIGHT; j ++) {
			isWinning &= [gamePanel[i][j] isWinning];
		}
	}
	
	if (isWinning) {
		[self win];
	}
}

-(void) win {

	// Set the status to win, and unlock the next stage
}

-(void) response {

	[self updateItems];
	[self drawItems];
	[self checkWin];
}

-(void) resetStage {
	
	NSLog(@"Reset Stage.");
	
	[gameStage clearAllRecord];
	
	CCScene *scene = [GameScene scene: [gameStage stageId]];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
}

-(void) backToHomePage {
	
	NSLog(@"Back to home page.");
	
	CCScene *scene = [StageScene scene];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
	
	//[self release];
}

-(void) goToPreviousStage {
	
	if([gameStage stageId] <= 1)
	{
		NSLog(@"This is the first stage, cannot go to previous stage");
		return;
	}
	
	NSLog(@"Go to previous stage.");
	CCScene *scene = [GameScene scene: [gameStage stageId]-1];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];
}

-(void) goToNextStage {

	if([gameStage stageId] >= 25)
	{
		NSLog(@"This is the last stage, cannot go to next stage");
		return;
	}
	
	NSLog(@"Go to next stage.");
	CCScene *scene = [GameScene scene: [gameStage stageId]+1];
	[[CCDirector sharedDirector] pushScene: [CCTransitionFade transitionWithDuration:1.0 scene:scene]];

}

- (void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	
	NSLog(@"Clicked");
	
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
	
	if ([previousButton isClickedOn:convertedLocation]) {
		return;
	}
	if ([nextButton isClickedOn:convertedLocation]) {
		return;
	}
	if ([resetButton isClickedOn:convertedLocation]) {
		return;
	}
	if ([backButton isClickedOn:convertedLocation]) {
		return;
	}
	
	// [test removeFromParentAndCleanup:TRUE];
	
	if (holdingDrawableType != nil) {
		// If currently is holding item, ignore this
		return;
	}
	
	Brick * brick = [self locateBrick:convertedLocation];
	if (brick == nil || ![brick isMovable]) {
		return;
	}
	
	selectedBrick = brick;
	
	// Record the item Id before picking the object
	selectedItemId = [brick getItemId];
	NSLog(@"Get Item Id: %d", selectedItemId);
}

- (void) ccTouchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
	
	UITouch *touch = [touches anyObject];
	
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
	
	if (selectedBrick == nil) {
		return;
	}
	
	if (holdingDrawableType == nil) {
		
		// Do pick this brick
		holdingDrawableType = [selectedBrick picking];
		holdingSprite = [SpriteStore getSpriteByDrawableType:holdingDrawableType];
		holdingSprite.scaleX = 1.5;
		holdingSprite.scaleY = 1.5;
		
		[self addChild:holdingSprite];
	}
	
	// Move the picked sprite
	if (holdingSprite != nil) {
		holdingSprite.position = convertedLocation;
	}
}

- (void) ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	
	UITouch *touch = [touches anyObject];
	
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
	
	if (selectedBrick == nil) {
		return;
	}
	
	if (holdingDrawableType == nil || holdingSprite == nil) {
		// Didn't move, just rotate it
		[selectedBrick rotate:TRUE];
	}
	else {
		// Put the mirror in new position or put it back
		
		Brick * brick = [self locateBrick:convertedLocation];
		Mirror *mirror = [[Mirror alloc] initWithType:[holdingDrawableType type] direction:[holdingDrawableType subtype]];
	
		if (brick != nil && ![brick isOccupied]) {
			selectedBrick = brick;
			NSLog(@"Locate new position.");
		}
		
		[selectedBrick put:mirror];
		NSLog(@"Put mirror down.");
				
		// Release the resource
		[mirror release];
		[holdingSprite removeFromParentAndCleanup:TRUE];
		[holdingDrawableType release];
		holdingDrawableType = nil;
		holdingSprite = nil;
		
		NSLog(@"Released holding sprite.");
	}
	
	// Save to record
	[self saveSelectedItem:selectedItemId toBrick:selectedBrick];
	
	// Redraw the screen
	selectedBrick = nil;
	
	[self response];
}

-(void) saveSelectedItem:(int)itemId toBrick:(Brick *)brick {

	if (itemId < 0 || brick == nil) {
		return;
	}
	
	GameRecord *record = [[GameRecord alloc] initWithId:itemId location:[brick location] drawableType:[brick drawableType]];
	[gameStage update:[record autorelease]];
}

-(Brick *) locateBrick:(CGPoint)point {

	if ((point.x > GAME_PANEL_LEFT && point.x < GAME_PANEL_LEFT + GAME_WIDTH * BRICK_SIZE)
	 && (point.y > GAME_PANEL_BUTTOM && point.y < GAME_PANEL_BUTTOM + GAME_HEIGHT * BRICK_SIZE)) {
		
		int posX = (point.x - GAME_PANEL_LEFT ) / BRICK_SIZE;
		int posY = (point.y - GAME_PANEL_BUTTOM) / BRICK_SIZE;
		
		NSLog(@"Hit game panel [%d, %d]", posX, posY);
		return gamePanel[posX][posY];
	}
	
	if ((point.x > MIRROR_PANEL_LEFT && point.x < MIRROR_PANEL_LEFT + MIRROR_WIDTH * BRICK_SIZE)
		&& (point.y > MIRROR_PANEL_BUTTOM && point.y < MIRROR_PANEL_BUTTOM + MIRROR_HEIGHT * BRICK_SIZE)) {
		
		int posX = (point.x - MIRROR_PANEL_LEFT ) / BRICK_SIZE;
		int posY = (point.y - MIRROR_PANEL_BUTTOM) / BRICK_SIZE;
	
		NSLog(@"Hit mirrors panel [%d, %d]", posX, posY);
		return mirrorsPanel[posX][posY];
	}
	
	return nil;
}

-(void) dealloc {

	if (gameStage != nil) {
		// [gameStage release];
	}
	
	for (int i = 0; i < GAME_WIDTH; i ++) {
		for (int j = 0; j < GAME_HEIGHT; j ++) {
			[gamePanel[i][j] release];
		}
	}
	for (int i = 0; i < MIRROR_WIDTH; i ++) {
		for (int j = 0; j < MIRROR_HEIGHT; j ++) {
			[mirrorsPanel[i][j] release];
		}
	}
	
	if (holdingSprite != nil) {
		[holdingSprite release];
	}
	
	[previousButton release];
	[nextButton release];
	[resetButton release];
	[backButton release];
	
	[super dealloc];
}

@end
