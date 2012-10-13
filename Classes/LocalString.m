//
//  LocalString.m
//  Jipozhuan
//
//  Created by sui toney on 11-6-24.
//  Copyright 2011 com.sharingpointer. All rights reserved.
//

#import "LocalString.h"

static NSString *language;
static NSMutableDictionary *dictionary;

@implementation LocalString


+(void) getUserLocale {
	
	if (language == NULL) {
		
		NSLog(@"Load Local Strings.");
		language = [[NSLocale currentLocale] objectForKey: NSLocaleLanguageCode];
		// NSLog(@"Language:");
		NSLog(@"Lan: %@", language);
		
		if (![language isEqualToString:@"zh"] &&
			![language isEqualToString:@"en"] &&
			![language isEqualToString:@"ja"]) {
			
			language = @"en";
		}
		
		[self loadLocaleStrings];
		//NSString   *language = [[NSLocale currentLocale] objectForKey: NSLocaleLanguageCode];
		//NSString   *countryCode = [[NSLocale currentLocale] objectForKey: NSLocaleCountryCode];
	}
}

+(void) loadLocaleStrings {
	
	dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setObject:@"Start" forKey:@"MainPageStart-en"];
	[dictionary setObject:@"Trophy" forKey:@"MainPageTrohpy-en"];
	[dictionary setObject:@"Settings" forKey:@"MainPageSettings-en"];
	[dictionary setObject:@"Select Mode" forKey:@"SelectModeMenu-en"];
	[dictionary setObject:@"Easy" forKey:@"SelectModeEasy-en"];
	[dictionary setObject:@"Hard" forKey:@"SelectModeHard-en"];
	[dictionary setObject:@"Trophy" forKey:@"TrophyMenu-en"];
	[dictionary setObject:@"Easy" forKey:@"TrophyEasy-en"];
	[dictionary setObject:@"Hard" forKey:@"TrophyHard-en"];
	[dictionary setObject:@"Clear all stages" forKey:@"TrophyJi-en"];
	[dictionary setObject:@"Without lose a life" forKey:@"TrophyQuan-en"];
	[dictionary setObject:@"Enemy killing rate over 70%" forKey:@"TrophyJian-en"];
	[dictionary setObject:@"Did not use any Bomb" forKey:@"TrophyQing-en"];
	[dictionary setObject:@"Settings" forKey:@"SettingsMenu-en"];
	[dictionary setObject:@"Music   On" forKey:@"SettingsMusicOn-en"];
	[dictionary setObject:@"Music   Off" forKey:@"SettingsMusicOff-en"];
	[dictionary setObject:@"Sound   On" forKey:@"SettingsSoundOn-en"];
	[dictionary setObject:@"Sound   Off" forKey:@"SettingsSoundOff-en"];
	[dictionary setObject:@"Back" forKey:@"CommonBack-en"];
	
	[dictionary setObject:@"开始" forKey:@"MainPageStart-zh"];
	[dictionary setObject:@"奖杯" forKey:@"MainPageTrohpy-zh"];
	[dictionary setObject:@"设置" forKey:@"MainPageSettings-zh"];
	[dictionary setObject:@"选择难度" forKey:@"SelectModeMenu-zh"];
	[dictionary setObject:@"简单" forKey:@"SelectModeEasy-zh"];
	[dictionary setObject:@"困难" forKey:@"SelectModeHard-zh"];
	[dictionary setObject:@"奖 杯" forKey:@"TrophyMenu-zh"];
	[dictionary setObject:@"简单" forKey:@"TrophyEasy-zh"];
	[dictionary setObject:@"困难" forKey:@"TrophyHard-zh"];
	[dictionary setObject:@"游戏成功通关" forKey:@"TrophyJi-zh"];
	[dictionary setObject:@"通关并一命未损" forKey:@"TrophyQuan-zh"];
	[dictionary setObject:@"击敌率达70%以上" forKey:@"TrophyJian-zh"];
	[dictionary setObject:@"整个游戏中未使用自爆" forKey:@"TrophyQing-zh"];
	[dictionary setObject:@"设置" forKey:@"SettingsMenu-zh"];
	[dictionary setObject:@"音乐   开" forKey:@"SettingsMusicOn-zh"];
	[dictionary setObject:@"音乐   关" forKey:@"SettingsMusicOff-zh"];
	[dictionary setObject:@"音效   开" forKey:@"SettingsSoundOn-zh"];
	[dictionary setObject:@"音效   关" forKey:@"SettingsSoundOff-zh"];
	[dictionary setObject:@"返回" forKey:@"CommonBack-zh"];
	
	[dictionary setObject:@"開始" forKey:@"MainPageStart-ja"];
	[dictionary setObject:@"カップ" forKey:@"MainPageTrohpy-ja"];
	[dictionary setObject:@"セットアップ" forKey:@"MainPageSettings-ja"];
	[dictionary setObject:@"選択" forKey:@"SelectModeMenu-ja"];
	[dictionary setObject:@"簡単な" forKey:@"SelectModeEasy-ja"];
	[dictionary setObject:@"困難" forKey:@"SelectModeHard-ja"];
	[dictionary setObject:@"カップ" forKey:@"TrophyMenu-ja"];
	[dictionary setObject:@"簡単" forKey:@"TrophyEasy-ja"];
	[dictionary setObject:@"困難" forKey:@"TrophyHard-ja"];
	[dictionary setObject:@"ゲームのクリアランス" forKey:@"TrophyJi-ja"];
	[dictionary setObject:@"損失なし" forKey:@"TrophyQuan-ja"];
	[dictionary setObject:@"70%の敵の破壊率" forKey:@"TrophyJian-ja"];
	[dictionary setObject:@"爆発物の使い道がない" forKey:@"TrophyQing-ja"];
	[dictionary setObject:@"セットアップ" forKey:@"SettingsMenu-ja"];
	[dictionary setObject:@"音楽   开" forKey:@"SettingsMusicOn-ja"];
	[dictionary setObject:@"音楽   关" forKey:@"SettingsMusicOff-ja"];
	[dictionary setObject:@"音声   开" forKey:@"SettingsSoundOn-ja"];
	[dictionary setObject:@"音声   关" forKey:@"SettingsSoundOff-ja"];
	[dictionary setObject:@"戻る" forKey:@"CommonBack-ja"];
	
	[dictionary retain];
}

+(NSString *) getString:(NSString *)strKey {
	
	[self getUserLocale];
	
	NSString *key = [NSString stringWithFormat:@"%@-%@", strKey, language];
	NSString *msg = [NSString stringWithFormat:@"String for key [%@]: %@", key, [dictionary objectForKey:key]];
	NSLog(@"%@", msg);
	
	return [dictionary objectForKey:key];
}

+(NSString *) MainPageStart {
	return [self getString:@"MainPageStart"];
}

+(NSString *) MainPageTrohpy {
	return [self getString:@"MainPageTrohpy"];
}

+(NSString *) MainPageSettings {
	return [self getString:@"MainPageSettings"];
}

+(NSString *) SelectModeMenu {
	return [self getString:@"SelectModeMenu"];
}

+(NSString *) SelectModeEasy {
	return [self getString:@"SelectModeEasy"];
}

+(NSString *) SelectModeHard {
	return [self getString:@"SelectModeHard"];
}

+(NSString *) TrophyMenu {
	return [self getString:@"TrophyMenu"];
}

+(NSString *) TrophyEasy {
	return [self getString:@"TrophyEasy"];
}

+(NSString *) TrophyHard {
	return [self getString:@"TrophyHard"];
}

+(NSString *) TrophyJi {
	return [self getString:@"TrophyJi"];
}

+(NSString *) TrophyQuan {
	return [self getString:@"TrophyQuan"];
}

+(NSString *) TrophyJian {
	return [self getString:@"TrophyJian"];
}

+(NSString *) TrophyQing {
	return [self getString:@"TrophyQing"];
}

+(NSString *) SettingsMenu {
	return [self getString:@"SettingsMenu"];
}

+(NSString *) SettingsMusicOn {
	return [self getString:@"SettingsMusicOn"];
}

+(NSString *) SettingsMusicOff {
	return [self getString:@"SettingsMusicOff"];
}
+(NSString *) SettingsSoundOn {
	return [self getString:@"SettingsSoundOn"];
}

+(NSString *) SettingsSoundOff {
	return [self getString:@"SettingsSoundOff"];
}

+(NSString *) CommonBack {
	return [self getString:@"CommonBack"];
}

+(NSString *) IntroFileName {
	
	[self getUserLocale];
	return [NSString stringWithFormat:@"Intro%@.png", language];
}


@end

