//
//  THLevelEditorV.h
//  Target-iPad
//
//  Created by Tom Hartley on 03/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THOptionsController.h"

@interface THLevelEditorV : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>{
	NSString *levelIDtoSaveTo;
	NSMutableArray *dataForLevel;
	IBOutlet UITableView *leftTableView;
	THOptionsController *optionsController;
	UIPopoverController *popoverController;
	UIActionSheet *sheet;
}

-(IBAction)save;
-(IBAction)options:(id)sender;
-(IBAction)newControl:(id)sender;
-(IBAction)editControls:(UIBarButtonItem *)sender;
-(IBAction)duplicateControl;
-(IBAction)deleteControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil newLevel:(BOOL)newLevel levelID:(NSString *)levelIDtoLoad;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
