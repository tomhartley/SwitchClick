//
//  THLevelPicker.h
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface THLevelPicker : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	NSArray *levelPaths;
	IBOutlet UINavigationBar *bar;
	NSString *levelPackName;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil levelPaths:(NSArray *)theLevelPaths withName:(NSString *)name;
- (IBAction)returnToMainMenu;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
