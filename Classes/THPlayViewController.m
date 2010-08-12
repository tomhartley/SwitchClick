//
//  THPlayViewController.m
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import "THPlayViewController.h"
#import "THLevelManager.h"

@implementation THPlayViewController


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withLevelID:(NSString *)levelIDToLoad withSection:(NSInteger) sectionNumber {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        levelID=levelIDToLoad;
		[levelID retain];
		sectionNumberOfCurrentLevel=sectionNumber;
		//helpLabel.frame=[[THLevelManager helpForID:levelID] sizeWithFont:[UIFont fontWithName:@"Helvetica" size:32] constrainedToSize:helpLabel.frame.size lineBreakMode:UILineBreakModeTailTruncation];
		CGSize theSize=[[THLevelManager helpForID:levelID] sizeWithFont:[UIFont fontWithName:@"Helvetica" size:32] constrainedToSize:helpLabel.frame.size lineBreakMode:UILineBreakModeTailTruncation];
		helpLabel.frame=CGRectMake(helpLabel.frame.origin.x, helpLabel.frame.origin.y, theSize.width, theSize.height);
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	/*[self performSelector:@selector(loadTheWhole) withObject:nil afterDelay:0.0001];
	 navBar.topItem.title=[THLevelManager nameForID:levelID];
	 navBar.topItem.prompt=[THLevelManager descriptionForID:levelID];
	 helpLabel.text=[THLevelManager helpForID:levelID];*/
	[self loadTheWhole];
}

-(void)loadTheWhole {
	theLevel = [[THLevelView alloc] initWithFrame:CGRectMake(0, 0, levelScrollView.frame.size.width - 10, 100) withID:levelID];
	levelScrollView.contentSize=CGSizeMake(theLevel.frame.size.width, theLevel.frame.size.height);
	[levelScrollView addSubview:theLevel];
	theLevel.delegate = self;
	moves=0;
	navBar.topItem.title=[THLevelManager nameForID:levelID];
	navBar.topItem.prompt=[THLevelManager descriptionForID:levelID];
	helpLabel.text=[THLevelManager helpForID:levelID];
	[self refreshCurrentLevel];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


- (IBAction)refreshCurrentLevel {
	[theLevel refreshTheLevel];
	moves=-1;
	[self moveMade];
	[self getNewTarget];
}

//Just refreshes target text, actually
-(void)getNewTarget {
	targetLabel.text=[NSString stringWithFormat:@"%d", [theLevel currentTarget]];
}

- (IBAction)back {
	[self dismissModalViewControllerAnimated:YES];
	[self.parentViewController performSelector:@selector(displaySectionNumber:) withObject:[NSNumber numberWithInt:sectionNumberOfCurrentLevel] afterDelay:0.8];
	[self autorelease];
}

-(void)moveMade {
	moves=moves+1;
	movesLabel.text=[NSString stringWithFormat:@"%d", moves];
	currentLabel.text=[NSString stringWithFormat:@"%d", [theLevel currentValue]];
	if ([theLevel currentValue] == [theLevel currentTarget] ) {
		if (moves==0) {
			[self refreshCurrentLevel];
		} else {
			NSString *label;
			if (moves==1) {
				label=[NSString stringWithFormat: @"You have finished the level in %d move!", moves];
			} else {
				label=[NSString stringWithFormat: @"You have finished the level in %d moves!", moves];
			}
			
			
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" 
															message:label
														   delegate:self 
												  cancelButtonTitle:@"Cancel" 
												  otherButtonTitles:@"New Variant", @"Menu", nil];
			[alert show];
			[alert release];
		}
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	switch (buttonIndex) {
		case 1:
			[self refreshCurrentLevel];
			break;
		case 2:
			[self back];
			break;
		default:
			break;
	}
}

@end
