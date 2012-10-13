//
//  LittleMirrorAppDelegate.h
//  LittleMirror
//
//  Created by sui toney on 11-7-10.
//  Copyright ms 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface LittleMirrorAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

-(void) deploy;

@end
