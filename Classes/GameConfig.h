//
//  GameConfig.h
//  PadTest
//
//  Created by sui toney on 11-7-3.
//  Copyright ms 2011. All rights reserved.
//

#ifndef __GAME_CONFIG_H
#define __GAME_CONFIG_H

//
// Supported Autorotations:
//		None,
//		UIViewController,
//		CCDirector
//
#define kGameAutorotationNone 0
#define kGameAutorotationCCDirector 1
#define kGameAutorotationUIViewController 2

//
// Define here the type of autorotation that you want for your game
//
#define GAME_AUTOROTATION kGameAutorotationUIViewController

#define GAME_PANEL_LEFT 24
#define GAME_PANEL_BUTTOM 24
#define BRICK_SIZE 60

#define GAME_WIDTH 12
#define GAME_HEIGHT 12

#define MIRROR_PANEL_LEFT 810
#define MIRROR_PANEL_BUTTOM 384
#define MIRROR_WIDTH 3
#define MIRROR_HEIGHT 6

#endif // __GAME_CONFIG_H