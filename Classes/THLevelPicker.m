    //
//  THLevelPicker.m
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import "THLevelPicker.h"
#import "THLevelManager.h"
#import "THPlayViewController.h"

@implementation THLevelPicker


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil levelPackNumber:(NSInteger)levelPackNumber {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		levelPack=levelPackNumber;
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	bar.topItem.title=[THLevelManager nameForSection:levelPack];
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

- (IBAction)returnToMainMenu {
	[self dismissModalViewControllerAnimated:YES];
	[self autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"singleLevelCell"];
	cell.textLabel.text= [THLevelManager nameForID:[THLevelManager IDForSection:levelPack forRow:indexPath.row]]; 
	cell.detailTextLabel.text= [THLevelManager descriptionForID:[THLevelManager IDForSection:levelPack forRow:indexPath.row]]; 
	return [cell autorelease];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [THLevelManager numberOfRowsInSection:levelPack];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	THPlayViewController *playView = [[THPlayViewController alloc] initWithNibName:@"THPlayViewController" bundle:nil withLevelID:[THLevelManager IDForSection:levelPack forRow:indexPath.row]withSection:levelPack];
	[playView setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
	[playView setModalPresentationStyle:UIModalPresentationPageSheet];
	UIViewController *temp=[self parentViewController];
	[self dismissModalViewControllerAnimated:YES];
	[self autorelease];
	[temp performSelector:@selector(displayViewController:) withObject:playView afterDelay:0.6];
}

@end

