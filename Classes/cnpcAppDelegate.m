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

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
