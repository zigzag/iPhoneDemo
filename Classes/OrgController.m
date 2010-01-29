//
//  OrgController.m
//  cnpc
//
//  Created by zigzag on 1/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OrgController.h"
#import "Definition.h"

@implementation OrgController

/* */
- (id)initWithLevel:(NSInteger)level{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
	currentLevel = level;
	NSLog(@"CurrentLevel:%d",currentLevel);
    if (self = [super init]) {
		switch (level)
		{
			case 0:
				self.title = @"首页";
				topList = [[NSMutableArray alloc] initWithObjects: @"全国",@"全国加油站汇总",@"全国油库汇总",nil];
				break;
			case 1:
				self.title = @"全国";
				topList = [[NSMutableArray alloc] initWithObjects: @"山东",@"山西",@"河南",@"河北",@"湖南",@"湖北",@"广东",@"广西",@"内蒙古",@"陕西",@"江西",nil];
				break;
			case 2:
				self.title = @"山东省";
				topList = [[NSMutableArray alloc] initWithObjects: @"青岛油库",@"潍坊油库",@"周村油库",nil];
				break;
			default:
				NSLog (@"Unexpected level for OrgController %d.", level);
				break;
		}
    }
    return self;
}


- (void)loadView {
	[super loadView];
	float startTop = 0.0f;
	
	sBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,startTop,320,40)];
	startTop += 40;
	sBar.delegate = self;
	[self.view addSubview:sBar];
	
	if (currentLevel == 2) {
		segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"油库",@"加油站",nil]];
		[segment setSelectedSegmentIndex:0];
		
		UIView *segmentView = [[[UITableView alloc]initWithFrame:CGRectMake(0,startTop, 320,60) style:UITableViewStyleGrouped] autorelease];
		[self.view addSubview:segmentView];

		[segment setFrame:CGRectMake(80,startTop + 10, 160,40)];
//		[segmentView addSubview:segment];
		
		startTop += 60;
		[self.view addSubview:segment];
	}
	
	tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,startTop,320,400) style:UITableViewStyleGrouped];
	tableView.delegate = self;
	tableView.dataSource = self;
	[self.view addSubview:tableView];
	
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
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

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return topList.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"TrailCell"];
    if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TrailCell"] autorelease];
		
		cell.textLabel.text = [topList objectAtIndex:indexPath.row];

		cell.imageView.image = [UIImage imageNamed:@"bar-chart.png"];
		cell.imageView.alpha = 0.0f;
		UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		[button setImage:[UIImage imageNamed:@"bar-chart.png"] forState:UIControlStateNormal];
		[button setImage:[UIImage imageNamed:@"bar-chart.png"] forState:UIControlStateHighlighted];

		button.contentEdgeInsets = UIEdgeInsetsMake(15, 15, 0, 0);
		[button addTarget: self action: @selector(jumpToReport) forControlEvents: UIControlEventTouchDown];
		
		[cell.contentView addSubview:button];
		if (currentLevel < 2) {
			cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		}
    }
	return cell;
	
//	UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:nil];
//    cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    cell.text = [topList objectAtIndex:indexPath.row];
//    return [cell autorelease];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Create a view controller with the title as its
	// navigation title and push it.
	NSUInteger row = indexPath.row;
	NSLog(@"Row Selected:%d",row);
	NSLog(@"currentOrg = %s",[Definition sharedDefinition].currentOrg);
	
	[[[Definition sharedDefinition] currentOrg] setString:[topList objectAtIndex:row]];

	if (row != NSNotFound && currentLevel < 2) {
		OrgController *l2OrgController = [[[OrgController alloc]initWithLevel:currentLevel + 1] autorelease];
		[[self navigationController] pushViewController:l2OrgController animated:YES];
	} 
}


/* */
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark searchBar delegate methods

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
	// only show the status bar’s cancel button while in edit mode
	sBar.showsCancelButton = YES;
	sBar.autocorrectionType = UITextAutocorrectionTypeNo;
	// flush the previous search content
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
	sBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[sBar resignFirstResponder];
	sBar.text = @"";
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

}

- (void) jumpToReport
{
	[UIView beginAnimations:@"GO_TO_REPORT" context:nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[[[[self tabBarController] viewControllers] objectAtIndex:0] view] cache:YES];
	[UIView commitAnimations];
}


-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	if (animationID == @"GO_TO_REPORT"){
//		NSLog(@"Will set title to:%s",[self currentOrg]);
		[[[[self tabBarController] viewControllers] objectAtIndex:0] setTitle:[[Definition sharedDefinition] currentOrg]];
		[[self tabBarController] setSelectedIndex:0];
	}
}


- (void)dealloc {
	[topList release];
	[sBar release];
	[segment release];
    [super dealloc];
}


@end

