//
//  THRandom.h
//  ControlPanel
//
//  Created by Tom Hartley on 13/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#include <stdlib.h>

@interface THRandom : NSObject {

}

+(NSInteger)randomNumberWithMin:(NSInteger)min WithMax:(NSInteger)max;
+(NSArray *)randomChoiceOf:(NSInteger)howManyToChoose withAllOptions:(NSInteger)numberToChooseFrom;
+(NSArray *)randomArrayMin:(NSInteger)minimum withMax:(NSInteger)maximum withLength:(NSInteger)arrayLength;
+(NSArray *)randomArrayFrom:(NSArray *)arrayToChooseFrom withLength:(NSInteger)length;
@end
