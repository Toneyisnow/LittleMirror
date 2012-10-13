//
//  DrawableType.m
//  PadTest
//
//  Created by sui toney on 11-7-7.
//  Copyright 2011 ms. All rights reserved.
//

#import "DrawableType.h"


@implementation DrawableType

-(id) initWithItem:(int)i type:(int)t subType:(int)s {

	self = [super init];
	
	item = i;
	type = t;
	subtype = s;
	
	return self;
}

-(int) item {
	return item;
}

-(int) type {
	return type;
}

-(int) subtype {
	return subtype;
}

-(void) changeSubtype:(int)s {

	subtype = s;
}

@end
