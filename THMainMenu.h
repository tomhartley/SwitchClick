//
//  THMainMenu.h
//  Target-iPad
//
//  Created by Tom Hartley on 30/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THMainMenu : UIViewController <UITableViewDelegate>{
	IBOutlet UITableView *theTableView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)displayViewController:(UIViewController *)viewController;
-(void)displaySectionNumber:(NSNumber *)sectionNumber;
@end