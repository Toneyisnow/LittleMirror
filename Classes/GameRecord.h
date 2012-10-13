//
//  GameRecord.h
//  PadTest
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrickLocation.h"
#import "DrawableType.h"


@interface GameRecord : NSObject {

	int itemId;
	BrickLocation *location;
	DrawableType *drawableType;
	
}

-(id) initWithId:(int)i location:(BrickLocation *)loc drawableType:(DrawableType *)d;

-(BrickLocation *) location;
-(DrawableType *) drawableType;
-(int) itemId;

@end
