//
//  THBinarySwitches.m
//  SwitchClick
//
//  Created by Tom Hartley on 16/04/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "THBinarySwitches.h"
#import "THLevelSolver.h"
#import "THRandom.h"
#import <QuartzCore/QuartzCore.h>

@implementation THBinarySwitches
@synthesize delegate, currentBinaryValue;

- (void)dealloc {
    [super dealloc];
}

-(id)initWithFrame:(CGRect)theFrame 
	  withSwitches:(NSInteger)numberOfSwitches 
   withNumberShown:(BOOL)valueShown 
withInactiveSwitches:(NSInteger)numberOfInactiveSwitches {
	
	switchesFromTopLeft = [[NSMutableArray alloc] init]; 
	//How big should I make myself?
	if (numberOfSwitches % 2==0) {
		//Even number of switches
		[self initWithFrame:CGRectMake(floor(theFrame.origin.x), floor(theFrame.origin.y), floor(theFrame.size.width),floor(((numberOfSwitches/2)*47)-20))];
	} else {
		//Odd number of switches
		[self initWithFrame:CGRectMake(floor(theFrame.origin.x), floor(theFrame.origin.y),floor( theFrame.size.width), floor((((numberOfSwitches+1)/2)*47)-20))];
	}
	
	//Create the switches
	for (NSInteger a=0; a<numberOfSwitches; a++) {
		if (a % 2 == 0) {
			//Left hand side switch
			//The last 2 parameters of CGRectMake are ignored
			UISwitch *leftSwitch=[[UISwitch alloc] initWithFrame:CGRectMake(floor(0), floor(47*(a/2)), floor(1), floor(1))];
			[switchesFromTopLeft addObject:leftSwitch];
			[self addSubview:[switchesFromTopLeft lastObject]];
			[leftSwitch release];
		} else {
			//Right hand side switch
			//The last 2 parameters of CGRect (size) are ignored for UISwitches (that's why they're 1)
			UISwitch *rightSwitch=[[UISwitch alloc] initWithFrame:CGRectMake(floor(self.frame.size.width-94), floor(47*((a-1)/2)), floor(1), floor(1))];
			[switchesFromTopLeft addObject:rightSwitch];
			[self addSubview:[switchesFromTopLeft lastObject]];
			[rightSwitch release];
		}
	}
	showsLabel=valueShown;
	
	//The next section subscribes to messages from all switches when their values change.
	NSUInteger i, count = [switchesFromTopLeft count];
	for (i = 0; i < count; i++) {
		UISwitch * aSwitch = [switchesFromTopLeft objectAtIndex:i];
		[aSwitch addTarget:self 
				action:@selector(buttonChanged) 
	  forControlEvents:UIControlEventValueChanged];
	}
	
	//Only make a label if a label should be shown, right?
	if (showsLabel==YES) {
		displayedValueLabel=[[UILabel alloc] initWithFrame:CGRectMake(94, 0, floor (self.frame.size.width-(2*94)), floor(self.frame.size.height))];
		[self addSubview:displayedValueLabel];
		displayedValueLabel.text=@"0";
		displayedValueLabel.textAlignment=UITextAlignmentCenter;
		displayedValueLabel.backgroundColor=[UIColor clearColor];
		displayedValueLabel.adjustsFontSizeToFitWidth=YES;
		displayedValueLabel.minimumFontSize=11.0;
		displayedValueLabel.font=[UIFont fontWithName:@"Helvetica" size:30];
		displayedValueLabel.shadowColor=[UIColor whiteColor];
		displayedValueLabel.shadowOffset=CGSizeMake(0, 1);
	}
	numberOfDisabledSwitches=numberOfInactiveSwitches;
	[self reload];
	//Create the light background so people can distinguish 2 sets of switches.
	self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.05];
	self.layer.cornerRadius=5.0;
	return self;
}

//Whenever a switch's value is changed this is called...
-(void)buttonChanged {
	[self updateValueLabel];
	[delegate performSelector:@selector(moveMade)];
}

//Performs the actual updating
-(void)updateValueLabel {
	NSMutableArray *arrayOfBinaries = [self newValuesOfAllSwitchesAsStringsInArray];
	currentBinaryValue=[THLevelSolver calculateBinaryWithStringBools: arrayOfBinaries];
	displayedValueLabel.text=[NSString stringWithFormat:@"%d",currentBinaryValue];
	[arrayOfBinaries release];
}

//Get the values of all switches as strings...
-(NSMutableArray *)newValuesOfAllSwitchesAsStringsInArray {
	//NSLog(@"count of switchesFromTopLeft: %d", [switchesFromTopLeft count]);
	NSMutableArray *arrayOfValues=[[NSMutableArray alloc] initWithCapacity:10];
	NSUInteger i, count = [switchesFromTopLeft count];
	for (i = 0; i < count; i++) {
		//NSLog(@"Hi, I'm here!");
		UISwitch * aSwitch = [switchesFromTopLeft objectAtIndex:i];
		if (aSwitch.on==YES) {
			//If it is on...
			[arrayOfValues addObject:@"1"];
		} else {
			[arrayOfValues addObject:@"0"];
		}
	}
	//NSLog(@"Count: arrayofvalues %d",[arrayOfValues count]);
	return arrayOfValues;
}

//Reload the view. This just re-randomizes the disabled switches, and sets the values of all switches randomly.
-(void)reload {
	
	NSUInteger i, count = [switchesFromTopLeft count];
	for (i = 0; i < count; i++) {
		UISwitch * aSwitch = [switchesFromTopLeft objectAtIndex:i];
		[aSwitch setOn:[THRandom randomNumberWithMin:0 WithMax:1] animated:YES];
		[aSwitch setEnabled:YES];
	}
	
	NSArray *arrayOfRandomSwitches = [THRandom randomChoiceOf:numberOfDisabledSwitches 
													   withAllOptions:[switchesFromTopLeft count]];
	count = [arrayOfRandomSwitches count];
	//NSLog(@"Hi, I'm here... (hopefully)");

	for (i = 0; i < count; i++) {
		NSString * aString = [arrayOfRandomSwitches objectAtIndex:i];
		//NSLog(@"Hi, I'm here... (hopefully) and the number is: %@", aString);

		[[switchesFromTopLeft objectAtIndex:[aString intValue]] setEnabled:NO];
	}
	
	[self updateValueLabel];
}

//Calculate a possible result for the set of switches. Takes into account disabled switches too.
-(NSString *)calculatePossibleResult {
	NSMutableArray *arrayOfBools=[[NSMutableArray alloc] init];

	NSUInteger i, count = [switchesFromTopLeft count];
	for (i = 0; i < count; i++) {
		UISwitch * aSwitch = [switchesFromTopLeft objectAtIndex:i];
		if (aSwitch.enabled==YES) {
			if ([THRandom randomNumberWithMin:0 WithMax:1]==0) {
				[arrayOfBools addObject:@"0"];
			} else {
				[arrayOfBools addObject:@"1"];
			}
		} else {
			if (aSwitch.on==YES) {
				[arrayOfBools addObject:@"1"];
			} else {
				[arrayOfBools addObject:@"0"];
			}
		}
	}
	NSInteger x = [THLevelSolver calculateBinaryWithStringBools:arrayOfBools];
	[arrayOfBools release];
	return [NSString stringWithFormat:@"%d", x];
}

-(NSString *)currentStringValue {
	return [NSString stringWithFormat:@"%d", currentBinaryValue];
}

@end