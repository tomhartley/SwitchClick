//
//  THOptionsController.h
//  Target-iPad
//
//  Created by Tom Hartley on 04/06/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface THOptionsController : UIViewController <UIPopoverControllerDelegate>{
	IBOutlet UIScrollView *theScrollView;
	IBOutlet UITextField *nameField;
	IBOutlet UITextField *descriptionField;
	IBOutlet UITextField *helpField;
	IBOutlet UISwitch *switch1;
	IBOutlet UISwitch *switch2;
	IBOutlet UISwitch *switch3;
	IBOutlet UISwitch *switch4;
	IBOutlet UISwitch *showsOperations;
}

-(void)dismissFirstResponder;
-(NSDictionary *)dictionaryRepresentation;
- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController;
@end
