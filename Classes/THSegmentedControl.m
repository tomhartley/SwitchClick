//
//  THSegmentedControl.m
//  SwitchClick
//
//  Created by Tom Hartley on 16/04/10.
//  Copyright 2010 Apple Inc. All rights reserved. 
//

#import "THSegmentedControl.h"
#import "THRandom.h"

@implementation THSegmentedControl
@synthesize delegate;
-(id)initWithCapacity:(NSInteger)capacity withMinimum:(NSInteger)minimum withMaximum:(NSInteger)maximum {
	NSMutableArray *arrayOfEmpties=[NSMutableArray array];
	for (; capacity>0; capacity--) {
		[arrayOfEmpties addObject:@""];
	}
	[self initWithItems:arrayOfEmpties];
	minimumRandom=minimum;
	maximumRandom=maximum;
	[self reload];
	self.selectedSegmentIndex=0;
	[self addTarget:self 
			 action:@selector(buttonChanged) 
   forControlEvents:UIControlEventValueChanged];
	self.segmentedControlStyle=3;
	return self;
}

-(void)reload {
	for (int counter=0; counter<[self numberOfSegments]; counter++) {
		NSInteger randomChoice = [THRandom randomNumberWithMin:minimumRandom WithMax:maximumRandom];
		[self setTitle:[NSString stringWithFormat:@"%d", randomChoice] forSegmentAtIndex:counter];
	}
}

-(NSString *)calculatePossibleResult {
	int randomNumber=[THRandom randomNumberWithMin:0 WithMax:[self numberOfSegments]-1];
	return [self titleForSegmentAtIndex:randomNumber];
}

-(NSString *)currentStringValue {
	return [self titleForSegmentAtIndex:[self selectedSegmentIndex]];
}

-(void)buttonChanged {
	[delegate performSelector:@selector(moveMade)];
}

@end
