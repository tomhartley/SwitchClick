//
//  THCustomLevelManagerView.h
//  Target-iPad
//
//  Created by Tom Hartley on 03/06/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface THCustomLevelManagerView : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *theTableView;
	IBOutlet UIBarButtonItem *leftButtonItem;
	IBOutlet UIBarButtonItem *rightButtonItem;
}

-(IBAction)editCancel;
-(IBAction)back;
-(IBAction)newLevel;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;
@end
