//
//  THLevelManager.m
//  SwitchClick
//
//  Created by Tom Hartley on 23/05/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import "THLevelManager.h"


@implementation THLevelManager

+(NSString *)nameForID:(NSString *)levelID {
	NSArray *arrayOfDictionaries = [THLevelManager arrayOfDictionariesForID:levelID];
	return [[arrayOfDictionaries objectAtIndex:[arrayOfDictionaries count]-1] objectForKey:@"HumanReadableName"];
}

+(NSString *)descriptionForID:(NSString *)levelID {
		NSArray *arrayOfDictionaries = [THLevelManager arrayOfDictionariesForID:levelID];
	return [[arrayOfDictionaries objectAtIndex:[arrayOfDictionaries count]-1] objectForKey:@"HumanReadableDescription"];
}

+(NSArray *)arrayOfDictionariesForID:(NSString *)levelID {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:levelID ofType:@"SwitchClick"];
	NSArray *arrayOfDictionaries = [[NSArray alloc] initWithContentsOfFile:thePlist];
	return [arrayOfDictionaries autorelease];
}

+(NSArray *)arrayOfOperationsForID:(NSString *)levelID {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:levelID ofType:@"SwitchClick"];
	NSArray *arrayOfOperations = [[NSArray alloc] initWithContentsOfFile:thePlist];
	arrayOfOperations=[[arrayOfOperations lastObject] objectForKey:@"Operations"];
	return arrayOfOperations;	
}

+(NSString *)IDForSection:(NSInteger)sectionNumber forRow:(NSInteger)rowNumber {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:@"LevelList" ofType:@"plist"];
	NSArray *arrayOfLevels = [NSArray arrayWithContentsOfFile:thePlist];
	return [[arrayOfLevels objectAtIndex:sectionNumber] objectAtIndex:rowNumber];
}

+(NSInteger)numberOfRowsInSection:(NSInteger)sectionNumber {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:@"LevelList" ofType:@"plist"];
	NSArray *arrayOfLevels = [NSArray arrayWithContentsOfFile:thePlist];
	return [[arrayOfLevels objectAtIndex:sectionNumber]count]-1;
}

+(NSInteger)numberOfLevelPacks {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:@"LevelList" ofType:@"plist"];
	NSArray *arrayOfLevels = [NSArray arrayWithContentsOfFile:thePlist];
	return [arrayOfLevels count];
}

+(NSString *)descriptionForSection:(NSInteger)sectionNumber {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:@"LevelList" ofType:@"plist"];
	NSArray *arrayOfLevels = [NSArray arrayWithContentsOfFile:thePlist];
	return [[[arrayOfLevels objectAtIndex:sectionNumber] lastObject] objectForKey:@"description"];
}

+(NSString *)nameForSection:(NSInteger)sectionNumber {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:@"LevelList" ofType:@"plist"];
	NSArray *arrayOfLevels = [NSArray arrayWithContentsOfFile:thePlist];
	return [[[arrayOfLevels objectAtIndex:sectionNumber] lastObject] objectForKey:@"name"];
}

+(NSString *)helpForID:(NSString *)levelID {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:levelID ofType:@"SwitchClick"];
	NSArray *arrayOfDictionaries = [NSArray arrayWithContentsOfFile:thePlist];
	return [[arrayOfDictionaries lastObject] objectForKey:@"HumanReadableHelp"];
}

+(void) moveIndex:(NSInteger)index1 toIndex:(NSInteger)index2 inSection:(NSInteger)sectionNumber {
	NSString *thePlist = [[NSBundle mainBundle]  pathForResource:@"LevelList" ofType:@"plist"];
	NSMutableArray *arrayOfLevels = [NSMutableArray arrayWithContentsOfFile:thePlist];
	NSMutableArray *arrayToChange = [arrayOfLevels objectAtIndex:sectionNumber];
	id x=[arrayToChange objectAtIndex:index1];
	[arrayToChange removeObjectAtIndex:index1];
	[arrayToChange insertObject:x atIndex:index2];
	[arrayOfLevels writeToFile:thePlist atomically:YES];
}
@end
