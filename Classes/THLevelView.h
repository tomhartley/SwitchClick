//
//  THLevelView.h
//  SwitchClick
//
//  Created by Tom Hartley on 18/04/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface THLevelView : UIView {
	NSMutableArray *arrayOfLevelObjects;
	NSMutableArray *arrayOfPlusMinuses;
	NSInteger target;
	NSInteger currentValue;
	id delegate;
	NSArray* operations;
}

- (id)initWithFrame:(CGRect)frame withID:(NSString *)levelID;
- (void)loadYourself;
- (void)moveMade;
-(void)refreshTheLevel;
-(void)newTargetAndOperationsForCurrentValues;
-(NSInteger)currentValue;
-(NSInteger)currentTarget;
-(void)updateCurrentValue;
-(NSArray*)newGetValuesAsArray;

@property (retain, nonatomic) id delegate;

@end
