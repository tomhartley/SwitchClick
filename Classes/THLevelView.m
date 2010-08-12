//
//  THLevelView.m
//  SwitchClick
//
//  Created by Tom Hartley on 18/04/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import "THLevelView.h"
#import "THBinarySwitches.h"
#import "THSegmentedControl.h"
#import <QuartzCore/QuartzCore.h>
#import "THRandom.h"
#import "THLevelSolver.h"
#import "THLevelManager.h"

@implementation THLevelView
@synthesize delegate;

//Initialiser
- (id)initWithFrame:(CGRect)frame withID:(NSString *)levelID {
    if ((self = [super initWithFrame:frame])) {
		NSInteger selfWidth = frame.size.width;
		NSArray *arrayOfDictionaries = [[THLevelManager arrayOfDictionariesForID:levelID] retain];
		arrayOfLevelObjects=[[NSMutableArray alloc] init];
		NSUInteger i, count = [arrayOfDictionaries count]-1;
		for (i = 0; i < count; i++) {
			NSDictionary * aDictionary = [arrayOfDictionaries objectAtIndex:i];
			if ([[aDictionary valueForKey:@"type"] isEqual:@"binary"]) {
				//the value being processed is a set of binary switches
				[arrayOfLevelObjects addObject:[[[THBinarySwitches alloc] 
					initWithFrame:CGRectMake(0, 0, selfWidth, 10) 
					withSwitches:[[aDictionary valueForKey:@"numberOfSwitches"] intValue] 
					withNumberShown:[[aDictionary valueForKey:@"numberShown"] boolValue] 
					withInactiveSwitches:[[aDictionary valueForKey:@"inactiveSwitches"]intValue]] autorelease]];
				
			} else if ([[aDictionary valueForKey:@"type"] isEqual:@"segmented"]) {
				
				//the value being processed is a Segmented Control
				[arrayOfLevelObjects addObject:[[[THSegmentedControl alloc] 
					initWithCapacity:[[aDictionary valueForKey:@"numberOfSegments"] intValue]
					withMinimum:[[aDictionary valueForKey:@"minimumNumber"] intValue]
					withMaximum:[[aDictionary valueForKey:@"maximumNumber"] intValue]]autorelease]];
			}
			
		}
		[arrayOfDictionaries autorelease];
		operations=[THLevelManager arrayOfOperationsForID:levelID];
		[operations retain];
		[self loadYourself];
	}
	return self;
}


- (void)dealloc {
	[arrayOfLevelObjects release];
    [super dealloc];
}

//Lays out the subviews
- (void)layoutSubviews {
	NSInteger theWidth = self.frame.size.width;
	NSInteger totalHeightSoFar = 20;
	NSUInteger i, count = [arrayOfLevelObjects count];
	for (i = 0; i < count; i++) {
		UIView * aView = [arrayOfLevelObjects objectAtIndex:i];
		NSInteger theHeight = aView.frame.size.height;
		aView.frame=CGRectMake(0, totalHeightSoFar, theWidth, theHeight);
		totalHeightSoFar=totalHeightSoFar+theHeight+20;
	}
	self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, totalHeightSoFar);
}


//Sets up (not lays out) all the subviews.
- (void)loadYourself {
	NSUInteger i, count = [arrayOfLevelObjects count];
	for (i = 0; i < count; i++) {
		UIView * aView = [arrayOfLevelObjects objectAtIndex:i];
		[self addSubview:aView];
		//[aView setDelegate:self];
		[aView performSelector:@selector(setDelegate:) withObject:self];
		aView.layer.cornerRadius=10.0;
	}
	[self layoutSubviews];
}

//Called whenever a thing is changed
- (void)moveMade {
	[delegate performSelector:@selector(moveMade)];
}

//Get new target and operation for level
-(void)refreshTheLevel {
 NSUInteger i, count = [arrayOfLevelObjects count];
 for (i = 0; i < count; i++) {
	 id obj = [arrayOfLevelObjects objectAtIndex:i];
	 [obj reload];
 }
	[self newTargetAndOperationsForCurrentValues];
}

-(void)newTargetAndOperationsForCurrentValues {
	arrayOfPlusMinuses=[[THRandom randomArrayFrom:operations withLength:[arrayOfLevelObjects count]-1] mutableCopy];
	[arrayOfPlusMinuses retain];
	NSMutableArray *arrayOfNums = [NSMutableArray array];
	NSUInteger i, count = [arrayOfLevelObjects count];
	for (i = 0; i < count; i++) {
		id obj = [arrayOfLevelObjects objectAtIndex:i];
		[arrayOfNums addObject:[obj calculatePossibleResult]];
	}
	target=[THLevelSolver getResultWithValues:arrayOfNums withOperations:arrayOfPlusMinuses];
}

//returns the current value represented by the level
-(NSInteger)currentValue {
	[self updateCurrentValue];
	return currentValue;
	
}

//Called by the owner to get the current target
-(NSInteger)currentTarget {
	return target;
}

-(void)updateCurrentValue {
	currentValue=[THLevelSolver getResultWithValues:[[self newGetValuesAsArray]autorelease] withOperations:arrayOfPlusMinuses];
}

-(NSArray*)newGetValuesAsArray {
	NSMutableArray *arrayOfNums = [[NSMutableArray alloc] init];
	NSUInteger i, count = [arrayOfLevelObjects count];
	for (i = 0; i < count; i++) {
		id obj = [arrayOfLevelObjects objectAtIndex:i];
		[arrayOfNums addObject:[obj currentStringValue]];

	}
	return arrayOfNums;
}
@end
