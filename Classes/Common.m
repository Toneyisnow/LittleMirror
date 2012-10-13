//
//  Common.m
//  LittleMirror
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "Common.h"


@implementation Common

+(NSString *) GetDocumentDir {
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSLog(@"GetDocumentDir:%@", [paths objectAtIndex:0]);
	
    return [paths objectAtIndex:0];
}

+(void) CopyFile:(NSString *)srcFile toPath:(NSString *)destPath overwrite:(BOOL)overwrite {
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error = nil;
	
	NSLog(@"Copying [%@] to [%@].", srcFile, destPath);
	
	if([fileManager fileExistsAtPath:destPath]) {
		
		if (overwrite) {
			NSLog(@"File already exists, removing it.");
			[fileManager removeItemAtPath:destPath error:&error];
		} else {
			NSLog(@"File already exists, skip copy. [%@]", destPath);
			return;
		}
	}
	
	if ([fileManager copyItemAtPath:srcFile toPath:destPath error:&error]) {

		NSLog(@"Copied file [%@] to [%@] finished.", srcFile, destPath);
	} else {
		// Handle the error.
		NSLog(@"Error copying file: [%@]", error);
	}
	
}


@end
