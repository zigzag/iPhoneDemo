//
//  cnpcAppDelegate.m
//  cnpc
//
//  Created by zigzag on 1/22/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "cnpcAppDelegate.h"
#import "ReportController.h"
#import "OrgController.h"


@implementation cnpcAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	tabbarController = [[UITabBarController alloc] init];
	
	// Get array of screens
	// Build array of UIViewControllers for each screen

	ReportController *reportController = [[[ReportController alloc]init] autorelease];
	[reportController setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"业务" image:[UIImage imageNamed:@"bar-chart.png"] tag:1]];

	OrgController *orgController = [[[OrgController alloc]initWithLevel:0] autorelease];
	[orgController setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"组织" image:[UIImage imageNamed:@"fuel.png"] tag:2]];
	navigationController = [[[UINavigationController alloc] initWithRootViewController:orgController] autorelease];

	UIViewController *markedController = [[[UIViewController alloc]init] autorelease];
	[markedController setTabBarItem:[[UITabBarItem alloc]initWithTitle:@"收藏" image:[UIImage imageNamed:@"star.png"] tag:3]];
	
	tabbarController.viewControllers = [NSArray arrayWithObjects:reportController, navigationController, markedController, nil];
	
	[window addSubview:tabbarController.view];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
	
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
