//
//  Target_iPadAppDelegate.m
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright Tom Hartley 2010. All rights reserved.
//

#import "Target_iPadAppDelegate.h"
#import "Target_iPadViewController.h"

@implementation Target_iPadAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
