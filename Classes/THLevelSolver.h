//
//  THLevelSolver.h
//  SwitchClick
//
//  Created by Tom Hartley on 15/04/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface THLevelSolver : NSObject {

}

+(NSInteger)getResultWithValues:(NSArray *)values withOperations:(NSArray *)operations;
+(NSInteger)calculateBinaryWithStringBools:(NSArray *)arrayOfBinaries;
@end
