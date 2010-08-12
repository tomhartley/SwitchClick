//
//  THLevelEditorV.m
//  Target-iPad
//
//  Created by Tom Hartley on 03/06/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
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
		dataForLevel=[[NSMutableArray alloc] initWithCapacity:100];
    }
    return self;
}



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 [super viewDidLoad];
	 leftTableView.separatorColor=[UIColor lightGrayColor];
 }

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
		sender.title=@"Done";
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
		//cell.textLabel.shadowColor=[UIColor whiteColor];
		//cell.textLabel.shadowOffset=CGSizeMake(0, 1);
		UISegmentedControl *seggy = [[[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"", @"", nil]] autorelease];
		//seggy.segmentedControlStyle=3;
		seggy.selectedSegmentIndex=0;
		seggy.frame=CGRectMake(0, 0, 95, seggy.frame.size.height);
		cell.accessoryView=seggy;
	} else {
		//The row is for some binary switches
		cell.textLabel.text=@"Binary Switches";
		cell.accessoryView=[[[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 0, 0)] autorelease];
		//cell.textLabel.shadowColor=[UIColor whiteColor];
		//cell.textLabel.shadowOffset=CGSizeMake(0, 1);
	}
	return [cell autorelease];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"dataForlevelCount:%d rowToDelete:%d", [dataForLevel count], indexPath.row);
	[dataForLevel removeObjectAtIndex:indexPath.row];
	[leftTableView deleteRowsAtIndexPaths:[NSArray  arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	id temp = [dataForLevel objectAtIndex:fromIndexPath.row];
	[dataForLevel removeObjectAtIndex:fromIndexPath.row];
	[dataForLevel insertObject:temp atIndex:toIndexPath.row];
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
			[leftTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:([dataForLevel count]-1) inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
			break;
		case 1:
			//Binary Switches
			[dataForLevel addObject:[THLevelCreatingBrains dictionaryForBinary]];
			[leftTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:([dataForLevel count]-1) inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
			break;
			
		default:
			break;
	}
	
	
}
@end
