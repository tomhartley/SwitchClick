//
//  THLevelCreatingBrains.m
//  Target-iPad
//
//  Created by Tom Hartley on 06/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "THLevelCreatingBrains.h"


@implementation THLevelCreatingBrains

+(NSDictionary *)dictionaryForSegmented {
	NSMutableDictionary *dictionary=[[NSMutableDictionary alloc] initWithCapacity:4];
	[dictionary setObject:@"1" forKey:@"maximumNumber"];
	[dictionary setObject:@"0" forKey:@"minimumNumber"];
	[dictionary setObject:@"3" forKey:@"numberOfSegments"];
	[dictionary setObject:@"segmented" forKey:@"type"];
	return dictionary;
}

+(NSDictionary *)dictionaryForBinary {
	NSMutableDictionary *dictionary=[[NSMutableDictionary alloc] initWithCapacity:4];
	[dictionary setObject:@"0" forKey:@"inactiveSwitches"];
	[dictionary setObject:@"4" forKey:@"numberOfSwitches"];
	[dictionary setObject:@"YES" forKey:@"numberShown"];
	[dictionary setObject:@"binary" forKey:@"type"];
	return dictionary;
}

@end
