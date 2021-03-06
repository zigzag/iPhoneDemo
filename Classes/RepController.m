//
//  RepController.m
//  cnpc
//
//  Created by zigzag on 1/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RepController.h"

@implementation RepController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/**/
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
//	webView.scalesPageToFit = YES;

	//	webView.autoresizesSubviews = YES;
	//	webView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	//	//set the web view and acceleration delagates for the web view to be itself
	////	[aWebView setDelegate:self];
	
//	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
//	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"pie" ofType:@"html"]isDirectory:NO]]];
	[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bar" ofType:@"html"]isDirectory:NO]]];

	[self.view addSubview:naviController.view];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

-(IBAction)tapSelectDate:(id)sender {
	NSLog(@"Selected Date Taped");
	[naviController pushViewController:datePickController animated:YES];
}

-(IBAction)tapToday:(id)sender {
	[datePicker setDate:[NSDate date]];
}

-(IBAction)switchChart:(id)sender{
	if ([chartSegment selectedSegmentIndex] == 2) {
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"pie" ofType:@"html"]isDirectory:NO]]];
	} else {
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bar" ofType:@"html"]isDirectory:NO]]];
	}
}

-(IBAction)bookMarkReport:(id)sender{
	[UIView beginAnimations:@"GO_TO_FAV" context:nil];
	[UIView setAnimationDuration:1.25];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationTransition:103 forView:[self view] cache:YES];

	[UIView commitAnimations];
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	if (animationID == @"GO_TO_FAV"){
		[[self tabBarController] setSelectedIndex:2];
	}
}

- (void)dealloc {
    [super dealloc];
}


@end
