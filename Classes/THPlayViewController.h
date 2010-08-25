//
//  THPlayViewController.h
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THLevelView.h"
#import "THLevelData.h"

@interface THPlayViewController : UIViewController {
	IBOutlet UIScrollView *levelScrollView;
	IBOutlet UILabel *targetLabel;
	IBOutlet UILabel *movesLabel;
	IBOutlet UILabel *currentLabel;
	IBOutlet UILabel *secondsLabel;
	IBOutlet UILabel *helpLabel;
	IBOutlet UINavigationBar *navBar;
	THLevelData *levelData;
	THLevelView *theLevel;
	NSInteger moves;
	NSInteger theTarget;
	NSArray *pathsForReturning; //For when we need to go back the the previous screen
	NSString *nameOfLevelPack;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withPath:(NSString *)levelPath withPaths:(NSArray *) paths withName:(NSString *)name;
- (IBAction)refreshCurrentLevel;
- (IBAction)back;
-(void)moveMade;
-(void)getNewTarget;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void)loadTheWhole;
@end
