    //
//  THLevelEditorV.m
//  Target-iPad
//
//  Created by Tom Hartley on 03/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "THLevelEditorV.h"
#import "THLevelCreatingBrains.h"

@implementation THLevelEditorV


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil newLevel:(BOOL)newLevel levelID:(NSString *)levelIDtoLoad{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		if (newLevel) {
			levelIDtoSaveTo=[[NSDate date] description];
		} else {
			
		}
    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

#pragma mark IBActions

-(IBAction)save {
	[self dismissModalViewControllerAnimated:YES];
	[self autorelease];
}

-(IBAction)options:(id)sender {
	if (optionsController==nil) {
		optionsController=[[THOptionsController alloc] initWithNibName:@"THOptionsController" bundle:nil];
	}
	if (popoverController==nil) {
		popoverController=[[UIPopoverController alloc] initWithContentViewController:optionsController];
		popoverController.delegate=optionsController;
	}
	if (popoverController.popoverVisible==YES) {
		[optionsController dismissFirstResponder];
		[popoverController dismissPopoverAnimated:YES];
	} else {
		[popoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	}
}


-(IBAction)newControl:(id)sender {
	if (sheet==nil) {
		sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Segmented Control", @"Binary Switches",nil];
	}
	if (sheet.visible) {
		[sheet dismissWithClickedButtonIndex:0 animated:YES];
	} else {
		[sheet showFromBarButtonItem:sender animated:YES];
	}
}

-(IBAction)editControls:(UIBarButtonItem *)sender {
	if (leftTableView.editing==YES) {
		[leftTableView setEditing:NO animated:YES];
		sender.title=@"Edit"; 
	} else {
		[leftTableView setEditing:YES animated:YES];
		sender.title=@"Cancel";
	}
	
}

-(IBAction)duplicateControl {
	
}

-(IBAction)deleteControl {
	
}
#pragma mark Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [dataForLevel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reusableCellID"];
	cell.showsReorderControl=YES;
	if ([[[dataForLevel objectAtIndex:indexPath.row] objectForKey:@"type"] isEqual:@"segmented"]) {
		//The row is for a segmented control
		cell.textLabel.text=@"Segmented Control";
	} else {
		//The row is for some binary switches
		cell.textLabel.text=@"Binary Switches";
	}
	return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	[dataForLevel removeObjectAtIndex:indexPath.row];
}

#pragma mark Table View Delegat Methods

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellEditingStyleDelete;
}

#pragma mark Action Sheet Delegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	switch (buttonIndex) {
		case 0:
			//Segmented Control
			[dataForLevel addObject:[THLevelCreatingBrains dictionaryForSegmented]];
			break;
		case 1:
			//Binary Switches
			[dataForLevel addObject:[THLevelCreatingBrains dictionaryForBinary]];
			break;

		default:
			break;
	}

}
@end
