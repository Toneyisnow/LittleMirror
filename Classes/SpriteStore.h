//
//  SpriteStore.h
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"
#import "DrawableType.h"

@interface SpriteStore : NSObject {

}

+(CCSprite *) getSpriteByDrawableType:(DrawableType *)drawableType;

+(CCSprite *) getMirrorSprite:(int)type direction:(int)direction;
+(CCSprite *) getFlowerSprite:(int)type status:(BOOL)lightedOn;
+(CCSprite *) getLaserSprite:(int)type direction:(int)direction;
+(CCSprite *) getLightSprite:(int)type direction:(int)direction;
//+(CCSprite *) getBlockSprite;

+(CCSprite *) getStageSprite:(int)level status:(int)status;

@end
