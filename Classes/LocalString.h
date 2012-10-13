//
//  LocalString.h
//  Jipozhuan
//
//  Created by sui toney on 11-6-24.
//  Copyright 2011 com.sharingpointer. All rights reserved.
//

#import "cocos2d.h"


@interface LocalString : NSObject {
	
}

+(void) getUserLocale;
+(void) loadLocaleStrings;

+(NSString *) MainPageStart;
+(NSString *) MainPageTrohpy;
+(NSString *) MainPageSettings;

+(NSString *) SelectModeMenu;
+(NSString *) SelectModeEasy;
+(NSString *) SelectModeHard;

+(NSString *) TrophyMenu;
+(NSString *) TrophyEasy;
+(NSString *) TrophyHard;
+(NSString *) TrophyJi;
+(NSString *) TrophyQuan;
+(NSString *) TrophyJian;
+(NSString *) TrophyQing;

+(NSString *) SettingsMenu;
+(NSString *) SettingsMusicOn;
+(NSString *) SettingsMusicOff;
+(NSString *) SettingsSoundOn;
+(NSString *) SettingsSoundOff;


+(NSString *) CommonBack;

+(NSString *) IntroFileName;


@end

