//
//  SpriteStore.m
//  PadTest
//
//  Created by sui toney on 11-7-5.
//  Copyright 2011 ms. All rights reserved.
//

#import "SpriteStore.h"

@implementation SpriteStore

+(CCSprite *) getSpriteByDrawableType:(DrawableType *)drawableType {

	switch ([drawableType item]) {
		case 0:
			return [self getMirrorSprite:[drawableType type] direction:[drawableType subtype]];
		case 1:
			return [self getFlowerSprite:[drawableType type] status:([drawableType subtype]==1) ? TRUE : FALSE];
		case 2:
			return [self getLaserSprite:[drawableType type] direction:[drawableType subtype]];
		default:
			return nil;
	}
}

+(CCSprite *) getMirrorSprite:(int)type direction:(int)direction {

	return [CCSprite spriteWithFile:@"MirrorStore.png" rect:CGRectMake(direction * 60, type * 60, 60, 60)];
}

+(CCSprite *) getFlowerSprite:(int)type status:(BOOL)lightedOn {
	
	int column = lightedOn ? 0 : 1;
	return [CCSprite spriteWithFile:@"FlowerStore.png" rect:CGRectMake(column * 60, type * 60, 60, 60)];
}

+(CCSprite *) getLaserSprite:(int)type direction:(int)direction {

	return [CCSprite spriteWithFile:@"LaserStore.png" rect:CGRectMake(direction * 60, type * 60, 60, 60)];
}

+(CCSprite *) getLightSprite:(int)type direction:(int)direction {

	return [CCSprite spriteWithFile:@"LightStore.png" rect:CGRectMake(direction * 60, type * 60, 60, 60)];
}

+(CCSprite *) getStageSprite:(int)level status:(int)status {

	return [CCSprite spriteWithFile:@"Icon.png" rect:CGRectMake(0, 0, 60, 60)];
}

/*
+(CCSprite *) getBlockSprite {

	return [CCSprite spriteWithFile:@"BlockStore.png" rect:CGRectMake(0, 0, 60, 60)];
}
*/

@end
