//
//  THLevelSolver.m
//  SwitchClick
//
//  Created by Tom Hartley on 15/04/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "THLevelSolver.h"
#import "THExponential.h"
//0 is +, 1 is -, 2 is *, 3 is /

@implementation THLevelSolver

+(NSInteger)getResultWithValues:(NSArray *)values withOperations:(NSArray *)operations {
	NSInteger total=[[values objectAtIndex:0] intValue];
	NSUInteger i, count = [values count];
	for (i = 1; i < count; i++) {
		NSInteger numberToOperateWith = [[values objectAtIndex:i] intValue];
		NSInteger operation = [[operations objectAtIndex:i-1] intValue];
		
		switch (operation) {
				//Plus
			case 0:
				total=total+numberToOperateWith;
				break;
			//Minus
			case 1:
				total=total-numberToOperateWith;
				break;
				//Times
			case 2:
		 		total=total*numberToOperateWith;
				break;
				//Divided
			case 3:
				total=total/numberToOperateWith;
				break;
			default:
				NSLog(@"Arghhhhhh... Operation number was %d", operation);
				break;
		}
		
	}
	return total;
}

+(NSInteger)calculateBinaryWithStringBools:(NSMutableArray *)arrayOfBinaries {
	//NSLog(@"arrayOfBinaries length: %d", [arrayOfBinaries count]);
	NSInteger total=0;
	NSInteger i, count = [arrayOfBinaries count];
	NSInteger iterateUp=0;
	for (i = count-1; i > -1; i=i-1) {
		NSString * aString = [arrayOfBinaries objectAtIndex:i];
		NSInteger poweredUp=[THExponential num:2 toThePowerOf:iterateUp];
		//NSLog(@"IterateUp %d", iterateUp);
		if ([aString isEqual:@"1"]) {
			total=total+poweredUp;
		}
		iterateUp++;
	}
	//NSLog(@"Total: %d", total);
	return total;
}

@end
