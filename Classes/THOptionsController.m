    //
//  THOptionsController.m
//  Target-iPad
//
//  Created by Tom Hartley on 04/06/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import "THOptionsController.h"


@implementation THOptionsController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		self.contentSizeForViewInPopover=CGSizeMake(320, 543);
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	theScrollView.contentSize=CGSizeMake(0, 543);
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

-(void)dismissFirstResponder {
	[nameField resignFirstResponder];
	[descriptionField resignFirstResponder];
	[helpField resignFirstResponder];
 }

-(NSDictionary *)dictionaryRepresentation {
	NSMutableArray *arrayOfOperations=[NSMutableArray arrayWithCapacity:10];
	if (switch1.on) {
		[arrayOfOperations addObject:@"0"];
	}
	if (switch2.on) {
		[arrayOfOperations addObject:@"1"];
	}
	if (switch3.on) {
		[arrayOfOperations addObject:@"2"];
	}
	if (switch4.on) {
		[arrayOfOperations addObject:@"3"];
	}
	NSMutableString *string=[NSMutableString string];
	if (showsOperations.on) {
		[string setString:@"YES"];
	} else {
		[string setString:@"NO"];
	}
	NSDictionary *dictForReturning = [NSDictionary dictionaryWithObjectsAndKeys:nameField.text, @"HumanReadableName", descriptionField.text, @"HumanReadableDescription", helpField.text, @"HumanReadableHelp",@"1.0", @"LevelFileFormatVersionNumber", arrayOfOperations, @"Operations", string, @"ShowsOperations",nil];
	return dictForReturning;
}

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController {
	[self dismissFirstResponder];
	return YES;
}

@end