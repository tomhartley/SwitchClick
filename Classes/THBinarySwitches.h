//
//  THBinarySwitches.h
//  SwitchClick
//
//  Created by Tom Hartley on 16/04/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface THBinarySwitches : UIView {
	BOOL showsLabel;
	UILabel *displayedValueLabel;
	NSInteger currentBinaryValue;
	NSMutableArray *switchesFromTopLeft;
	NSInteger numberOfDisabledSwitches;
	id delegate;
}

-(id)initWithFrame:(CGRect)theFrame 
	  withSwitches:(NSInteger)numberOfSwitches 
   withNumberShown:(BOOL)valueShown 
withInactiveSwitches:(NSInteger)numberOfInactiveSwitches;

-(void)buttonChanged;
-(void)updateValueLabel;
-(NSMutableArray *)newValuesOfAllSwitchesAsStringsInArray;
-(void)reload;
-(NSString *)calculatePossibleResult;
-(NSString *)currentStringValue;
@property (retain, nonatomic) id delegate;
@property (nonatomic, readonly) NSInteger currentBinaryValue;

@end
 