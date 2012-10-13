//
//  BrickLocation.h
//  PadTest
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrickLocation : NSObject {

	int panel;	// 0: MainPanel  1: MirrorsPanel
	int posX;
	int posY;
}

+(id) mainPanelX:(int)x Y:(int)y;
+(id) mirrorPanelX:(int)x Y:(int)y;

-(id) initWithPanel:(int)p X:(int)x Y:(int)y;

-(int) panel;
-(int) posX;
-(int) posY;

@end
