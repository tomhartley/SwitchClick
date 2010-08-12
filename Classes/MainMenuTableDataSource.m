//
//  MainMenuTableDataSource.m
//  Target-iPad
//
//  Created by Tom Hartley on 30/05/10.
//  Copyright 2010 Tom Hartley. All rights reserved.
//

#import "MainMenuTableDataSource.h"
#import "THLevelManager.h"

@implementation MainMenuTableDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	[self retain];
	return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return @"Play";
			break;
		case 1:
			return @"More Levels";
			break;
		case 2:
			return @"Other";
			break;
		default:
			return @"";
			break;
	}
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section==0) {
		if (indexPath.row>2) {
			return YES;
		}
	}
	return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section==0) {
		return YES;
	}
	return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text=[THLevelManager nameForSection:indexPath.row];
			cell.detailTextLabel.text=[THLevelManager descriptionForSection:indexPath.row];
			break;
			
		case 1:
			switch (indexPath.row) {
				case 0:
					cell.textLabel.text=@"Level Editor";
					break;
				case 1:
					cell.textLabel.text=@"Download Levels";
					break;					
				default:
					break;
			}			
			break;
			
		case 2:
			switch (indexPath.row) {
				case 0:
					cell.textLabel.text=@"Help";
					break;
				case 1:
					cell.textLabel.text=@"Credits";
					break;					
				default:
					break;
			}
			break;
			
		default:
			break;
	}
	return [cell autorelease];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return [THLevelManager numberOfLevelPacks];
			break;
		case 1:
			return 2;
			break;			
		case 2:
			return 2;
			break;						
		default:
			return 0;
			break;
	}
}

@end
