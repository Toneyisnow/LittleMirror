//
//  Common.h
//  LittleMirror
//
//  Created by sui toney on 11-7-10.
//  Copyright 2011 ms. All rights reserved.
//

#import "cocos2d.h"

@interface Common : NSObject {

	
}

+(NSString *) GetDocumentDir;

+(void) CopyFile:(NSString *)srcFile toPath:(NSString *)destPath overwrite:(BOOL)overwrite;


@end
