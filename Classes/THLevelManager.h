//
//  THLevelManager.h
//  SwitchClick
//
//  Created by Tom Hartley on 23/05/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface THLevelManager : NSObject {

}
//Get the HumanReadableName for a specific level ID
+(NSString *)nameForID:(NSString *)levelID;
//Get the HumanReadableDescription for a specific level ID
+(NSString *)descriptionForID:(NSString *)levelID;
//Get the dictionary for an ID
+(NSArray *)arrayOfDictionariesForID:(NSString *)levelID;
//Get the array of operations for an ID 
+(NSArray *)arrayOfOperationsForID:(NSString *)levelID;
//Get the ID for a specific section number and row 
+(NSString *)IDForSection:(NSInteger)sectionNumber forRow:(NSInteger)rowNumber;
//Get the number of rows in a section
+(NSInteger)numberOfRowsInSection:(NSInteger)sectionNumber;
//Get the number of sections without the final help/level editor
+(NSInteger)numberOfLevelPacks;
//The name, suitable for displaying in the header of table view section
+(NSString *)nameForSection:(NSInteger)sectionNumber;
//The description of a particular level pack
+(NSString *)descriptionForSection:(NSInteger)sectionNumber;
//The help string, if any, for a level
+(NSString *)helpForID:(NSString *)levelID;
//Swap 2 indexes in the same section
+(void) moveIndex:(NSInteger)index1 toIndex:(NSInteger)index2 inSection:(NSInteger)sectionNumber;

@end