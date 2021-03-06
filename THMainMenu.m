    //
//  THMainMenu.m
//  Target-iPad
//
//  Created by Tom Hartley on 30/05/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import "THMainMenu.h"
#import "THLevelPicker.h"
#import "THRandom.h"
#import "THCreditsView.h"
#import "THCustomLevelManagerView.h"
#import "THLevelManager.h"

@implementation THMainMenu

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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

//User tapped a row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	switch (indexPath.section) {
		case 0:
		{
			THLevelPicker *picker =[[THLevelPicker alloc] initWithNibName:@"THLevelPicker" bundle:nil levelPaths:[THLevelManager pathsForSection:indexPath.row] withName:[THLevelManager nameForSection:indexPath.row]];
			[picker setModalPresentationStyle:UIModalPresentationFormSheet];
			[picker setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
			[self presentModalViewController:picker animated:YES];
		}
			break;
		
		case 1:
		{
			THCustomLevelManagerView *custard =[[THCustomLevelManagerView alloc] initWithNibName:@"THCustomLevelManagerView" bundle:nil];
			[custard setModalPresentationStyle:UIModalPresentationFormSheet];
			[custard setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
			[self presentModalViewController:custard animated:YES];			
			
		}
		break;

			
		case 2:
			switch (indexPath.row) {
				case 0:
					break;
				case 1:
				{
					THCreditsView *credits =[[THCreditsView alloc] initWithNibName:@"THCreditsView" bundle:nil];
					[credits setModalPresentationStyle:UIModalPresentationFormSheet];
					[credits setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
					[self presentModalViewController:credits animated:YES];	
				}
				break;
				default:
					break;
			}
			break;

		default:
			break;
	}
}

-(void)displayViewController:(UIViewController *)viewController {
	[self presentModalViewController:viewController animated:YES];
}

-(void)displayPaths:(NSArray *)paths withName:(NSString *)name{
	THLevelPicker *picker =[[THLevelPicker alloc] initWithNibName:@"THLevelPicker" bundle:nil levelPaths:paths withName:name];
	[picker setModalPresentationStyle:UIModalPresentationFormSheet];
	[picker setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
	[self presentModalViewController:picker animated:YES];
} 
@end
