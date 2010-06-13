//
//  THSegmentedControl.h
//  SwitchClick
//
//  Created by Tom Hartley on 16/04/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface THSegmentedControl : UISegmentedControl {
	NSInteger maximumRandom;
	NSInteger minimumRandom;
	id delegate;
}
-(id)initWithCapacity:(NSInteger)capacity withMinimum:(NSInteger)minimum withMaximum:(NSInteger)maximum;
-(void)reload;
-(NSString *)calculatePossibleResult;
-(NSString *)currentStringValue;
-(void)buttonChanged;
@property (retain, nonatomic) id delegate;
@property (nonatomic)  NSInteger maximumRandom;
@property (nonatomic)  NSInteger minimumRandom;

@end
