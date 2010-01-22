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

	// important for view orientation rotation
	contentView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	self.view = contentView;
	self.view.autoresizesSubviews = YES;

	CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
	webFrame.origin.y -= 20.0;	// shift the display up so that it covers the default open space from the content view
	UIWebView *aWebView = [[UIWebView alloc] initWithFrame:webFrame];
//	
	aWebView.scalesPageToFit = YES;
	aWebView.autoresizesSubviews = YES;
	aWebView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
//	//set the web view and acceleration delagates for the web view to be itself
////	[aWebView setDelegate:self];
//	//determine the path the to the index.html file in the Resources directory
//	NSString *filePathString = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//	//build the URL and the request for the index.html file
	NSURL *aURL = [NSURL URLWithString:@"http://redmine.finalist.hk/projects/guanxin/burndown"];
	NSURLRequest *aRequest = [NSURLRequest requestWithURL:aURL];
//	//load the index.html file into the web view.
	[aWebView loadRequest:aRequest];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
