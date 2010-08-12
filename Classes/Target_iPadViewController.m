//
//  Target_iPadViewController.m
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright Tom Hartley 2010. All rights reserved.
//

#import "Target_iPadViewController.h"
#import "THLevelPicker.h"
#import "THMainMenu.h"

@implementation Target_iPadViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	if (UIInterfaceOrientationIsLandscape([self interfaceOrientation])) {
		[imageView setImage:[UIImage imageNamed:@"Default-Landscape.png"]];
	} else {
		[imageView setImage:[UIImage imageNamed:@"Default-Portrait.png"]];
	}
	[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(fadeToMainScreen) userInfo:nil repeats:NO];
}

-(void)fadeToMainScreen {
	THMainMenu *mainMenu =[[THMainMenu alloc] initWithNibName:@"THMainMenu" bundle:nil];
	[mainMenu setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
	[mainMenu setModalPresentationStyle:UIModalPresentationFullScreen];
	[self presentModalViewController:mainMenu animated:YES];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
		[imageView setImage:[UIImage imageNamed:@"Default-Landscape.png"]];
	} else {
		[imageView setImage:[UIImage imageNamed:@"Default-Portrait.png"]];
	}	
}	
		 

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
