    //
//  THCustomLevelManagerView.m
//  Target-iPad
//
//  Created by Tom Hartley on 03/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "THCustomLevelManagerView.h"
#import "THLevelManager.h"
#import "THLevelEditorV.h"

#define kCustomLevelPackNumber 2

@implementation THCustomLevelManagerView

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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

-(IBAction)editCancel {
	if (theTableView.editing==NO) {
		//Button is Edit
		[theTableView setEditing:YES animated:YES];
		rightButtonItem.title=@"Done";
	} else {
		//Button is Cancel
		[theTableView setEditing:NO animated:YES];
		rightButtonItem.title=@"Edit";
	}
}

-(IBAction)back {
	//Button is Back
	[self dismissModalViewControllerAnimated:YES];
	[self autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"singleLevelCell"];
	cell.showsReorderControl=YES;
	cell.textLabel.text= [THLevelManager nameForID:[THLevelManager IDForSection:kCustomLevelPackNumber forRow:indexPath.row]]; 
	cell.detailTextLabel.text= [THLevelManager descriptionForID:[THLevelManager IDForSection:kCustomLevelPackNumber forRow:indexPath.row]]; 
	return [cell autorelease];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [THLevelManager numberOfRowsInSection:kCustomLevelPackNumber];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	[self editCancel];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	[THLevelManager moveIndex:fromIndexPath.row toIndex:toIndexPath.row inSection:kCustomLevelPackNumber];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

-(IBAction)newLevel {
	THLevelEditorV *levelEditingView =[[THLevelEditorV alloc] initWithNibName:@"THLevelEditorV" bundle:nil newLevel:YES levelID:nil];
	levelEditingView.modalPresentationStyle=UIModalPresentationPageSheet;
	levelEditingView.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:levelEditingView animated:YES];
}

@end