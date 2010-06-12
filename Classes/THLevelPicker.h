//
//  THLevelPicker.h
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface THLevelPicker : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	NSInteger levelPack;
	IBOutlet UINavigationBar *bar;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil levelPackNumber:(NSInteger)levelPackNumber;
- (IBAction)returnToMainMenu;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
