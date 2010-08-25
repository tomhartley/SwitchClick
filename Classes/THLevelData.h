//
//  THLevelData.h
//  Target-iPad
//
//  Created by Tom Hartley on 22/08/2010.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface THLevelData : NSObject {
	NSString *levelPath;
	NSString *description;
	NSString *name;
	NSString *help;
	NSArray *data;
	BOOL showsOperations;
	NSArray *operations;
}

@property (nonatomic, retain) NSString *levelPath;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *help;
@property (nonatomic, retain) NSArray *data;
@property (nonatomic) BOOL customLevel;
@property (nonatomic) BOOL showsOperations;
@property (nonatomic, retain) NSArray *operations;

- (id)initWithPath:(NSString *)theLevelPath;
//No if it couldn't be saved, yes if it was succesful
//- (BOOL)save;
//No if it couldn't be reloaded, yes if it was succesful
- (BOOL)reload;

@end
