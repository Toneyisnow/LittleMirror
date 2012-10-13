//
//  GameButton.h
//  LittleMirror
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"
#import "Clickable.h"

@interface GameButton : Clickable {

	int buttonId;
}

-(id) initWithId:(int)i position:(CGPoint)pos target:(id)t action:(SEL)action;



//-(BOOL) clickOn:(CGPoint)pos;

@end
