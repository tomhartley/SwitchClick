//
//  THLevelData.m
//  Target-iPad
//
//  Created by Tom Hartley on 22/08/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "THLevelData.h"

@implementation THLevelData

@synthesize levelPath, description, name, help, data, customLevel, showsOperations,operations;

- (id)initWithPath:(NSString *)theLevelPath {
	if ((self = [super init])) {
		levelPath=[theLevelPath retain];
		[self reload];
	}
	return self;
}

- (BOOL)reload {
	NSArray *arrayOfDictionaries = [NSArray arrayWithContentsOfFile:self.levelPath];
	if (arrayOfDictionaries==nil) return NO;
	self.data=[arrayOfDictionaries subarrayWithRange:NSMakeRange(0, ([arrayOfDictionaries count]-1))];
	NSDictionary *tempDictionary=[arrayOfDictionaries lastObject];
	self.description=[tempDictionary objectForKey:@"HumanReadableDescription"];
	self.name=[tempDictionary objectForKey:@"HumanReadableName"];
	self.help=[tempDictionary objectForKey:@"HumanReadableHelp"];
	self.showsOperations=[[tempDictionary objectForKey:@"ShowsOperations"] boolValue];
	self.operations=[tempDictionary objectForKey:@"Operations"];
	return YES;
}

- (void)dealloc {
    // Clean-up code here.
    [levelPath release];
	levelPath=nil;
    [description release];
	description=nil;
    [name release];
	name=nil;
    [data release];
	data=nil;
    [operations release];
	operations=nil;
	
    [super dealloc];
}

@end
