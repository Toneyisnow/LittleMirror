//
//  StageScene.h
//  PadTest
//
//  Created by sui toney on 11-7-6.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"


@interface StageScene : CCLayer {

	int pageId;
}

+(id) scene;

-(void) loadPage:(int)page;

-(void) onStart1;
-(void) onStart2;
-(void) onStart3;


@end
