//
//  FavController.m
//  cnpc
//
//  Created by zigzag on 1/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FavController.h"


@implementation FavController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/* */
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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


- (void)dealloc {
    [super dealloc];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"TrailCell"];
    if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TrailCell"] autorelease];
		
		cell.textLabel.text = @"库存：100万吨";
		//[topList objectAtIndex:indexPath.row];
		
//		cell.imageView.image = [UIImage imageNamed:@"bar-chart.png"];
//		cell.imageView.alpha = 0.0f;
//		UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//		[button setImage:[UIImage imageNamed:@"bar-chart.png"] forState:UIControlStateNormal];
//		[button setImage:[UIImage imageNamed:@"bar-chart.png"] forState:UIControlStateHighlighted];
//		
//		button.contentEdgeInsets = UIEdgeInsetsMake(15, 15, 0, 0);
//		[button addTarget: self action: @selector(jumpToReport) forControlEvents: UIControlEventTouchDown];
		//		[cell.contentView addSubview:button];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
	return cell;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//	return [NSArray arrayWithObjects:@"青岛油库",@"潍坊油库",nil];
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSArray *sectionArray = [NSArray arrayWithObjects:@"青岛油库",@"潍坊油库",nil];
	return [sectionArray objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Create a view controller with the title as its
	// navigation title and push it.
	NSUInteger row = indexPath.row;
	NSLog(@"Selected Row:%d",row);

	[UIView beginAnimations:@"GO_TO_REPORT" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[[[[self tabBarController] viewControllers] objectAtIndex:0] view] cache:YES];
	[UIView commitAnimations];
}


/* */
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	if (animationID == @"GO_TO_REPORT"){
		[[self tabBarController] setSelectedIndex:0];
	}
}

@end
