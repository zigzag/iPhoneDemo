//
//  ReportController.m
//  cnpc
//
//  Created by zigzag on 1/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ReportController.h"


@implementation ReportController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	// the base view for this view controller
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	contentView.backgroundColor = [UIColor lightGrayColor];
	
	UINavigationBar *titleBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
	[titleBar pushNavigationItem:[[[UINavigationItem alloc]initWithTitle:@"全国销售日报"] autorelease] animated:NO];
	[contentView addSubview:titleBar];
	[titleBar release];
	
	// important for view orientation rotation
	contentView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	self.view = contentView;
	self.view.autoresizesSubviews = YES;

//	CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
//	webFrame.origin.y -= 20.0;	// shift the display up so that it covers the default open space from the content view
	UIWebView *aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45, 320, 400)];
//	
	aWebView.scalesPageToFit = YES;
	aWebView.autoresizesSubviews = YES;
	aWebView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
//	//set the web view and acceleration delagates for the web view to be itself
////	[aWebView setDelegate:self];

	[aWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
	
//	
//	//add the web view to the content view
	[contentView addSubview:aWebView];
	[aWebView release];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

/*
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	//CATransition *transition =[CATransition animation];
	//	[transition setType:kCATransitionFade];
	//	[transition setDuration:duration];
	//	[self.view.layer addAnimation:transition forKey:@"idunno"];
}
*/

/*
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
