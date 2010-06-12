//
//  THPlayViewController.h
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THLevelView.h"

@interface THPlayViewController : UIViewController {
	IBOutlet UIScrollView *levelScrollView;
	IBOutlet UILabel *targetLabel;
	IBOutlet UILabel *movesLabel;
	IBOutlet UILabel *currentLabel;
	IBOutlet UILabel *secondsLabel;
	IBOutlet UILabel *helpLabel;
	IBOutlet UINavigationBar *navBar;
	NSString *levelID;
	THLevelView *theLevel;
	NSInteger moves;
	NSInteger theTarget;
	NSInteger sectionNumberOfCurrentLevel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withLevelID:(NSString *)levelIDToLoad withSection:(NSInteger) sectionNumber;
- (IBAction)refreshCurrentLevel;
- (IBAction)back;
-(void)moveMade;
-(void)getNewTarget;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void)loadTheWhole;
@end
