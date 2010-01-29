//
//  cnpcAppDelegate.m
//  cnpc
//
//  Created by zigzag on 1/22/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "cnpcAppDelegate.h"
#import "OrgController.h"
#import "RepController.h"
#import "FavController.h"

@implementation cnpcAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	tabbarController = [[UITabBarController alloc] init];
	
	// Get array of screens
	// Build array of UIViewControllers for each screen

	RepController *repController = [[RepController alloc]initWithNibName:@"RepController" bundle:nil];
	
	[repController setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"业务" image:[UIImage imageNamed:@"bar-chart.png"] tag:1]];

	OrgController *orgController = [[[OrgController alloc]initWithLevel:0] autorelease];
	[orgController setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"组织" image:[UIImage imageNamed:@"fuel.png"] tag:2]];
	navigationController = [[[UINavigationController alloc] initWithRootViewController:orgController] autorelease];

	FavController *favController = [[[FavController alloc]init] autorelease];
	[favController setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"收藏" image:[UIImage imageNamed:@"star.png"] tag:3]];
	
	tabbarController.viewControllers = [NSArray arrayWithObjects:repController, navigationController, favController, nil];
	
	[window addSubview:tabbarController.view];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
	
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
