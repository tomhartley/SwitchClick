//
//  Target_iPadAppDelegate.h
//  Target-iPad
//
//  Created by Tom Hartley on 29/05/10.
//  Copyright Tom Hartley 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Target_iPadViewController;

@interface Target_iPadAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Target_iPadViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Target_iPadViewController *viewController;

@end

