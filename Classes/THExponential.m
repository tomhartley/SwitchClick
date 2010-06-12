//
//  THExponential.m
//  SwitchClick
//
//  Created by Tom Hartley on 17/04/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "THExponential.h"


@implementation THExponential
+(NSInteger)num:(NSInteger)num1 toThePowerOf: (NSInteger)num2{
	NSInteger total;
	total=1;
	for (int i=0; i<num2; i++) {
		total=num1*total;
	}
	//Output the values just to make sure they're correct...
	//NSLog (@"%d to the power of %d was %d",num1 ,num2 ,total );
	return total;
}
@end
