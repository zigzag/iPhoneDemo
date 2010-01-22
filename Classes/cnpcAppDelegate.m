//
//  cnpcAppDelegate.m
//  cnpc
//
//  Created by zigzag on 1/22/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "cnpcAppDelegate.h"

@implementation cnpcAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	tabbarController = [[UITabBarController alloc] init];
	
	// Get array of screens
	// Build array of UIViewControllers for each screen
	NSMutableArray  *viewControllers = [[NSMutableArray alloc] init];

	UIViewController *reportController = [[UIViewController alloc]init];
	[reportController setTabBarItem:[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemRecents tag:1]];
	[viewControllers addObject:reportController];
	[reportController release];

	UIViewController *orgController = [[UIViewController alloc]init];
	[orgController setTabBarItem:[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:2]];
	[viewControllers addObject:orgController];
	[orgController release];

	UIViewController *markedController = [[UIViewController alloc]init];
	[markedController setTabBarItem:[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:3]];
	[viewControllers addObject:markedController];
	[markedController release];
	
	[tabbarController setViewControllers:viewControllers];
	[viewControllers release];
	
	[window addSubview:tabbarController.view];
	
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];

	
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
