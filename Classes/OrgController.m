//
//  OrgController.m
//  cnpc
//
//  Created by zigzag on 1/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OrgController.h"
#import "ReportController.h"
#import "ReportImageControl.h"

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
				topList = [[NSArray alloc] initWithObjects: @"全国",@"全国加油站汇总",@"全国油库汇总",nil];
				break;
			case 1:
				self.title = @"全国";
				topList = [[NSArray alloc] initWithObjects: @"山东",@"山西",@"河南",@"河北",@"湖南",@"湖北",@"广东",@"广西",@"内蒙古",@"陕西",@"江西",nil];
				break;
			case 2:
				self.title = @"山东省";
				topList = [[NSArray alloc] initWithObjects: @"青岛油库",@"潍坊油库",@"周村油库",nil];
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
	sBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0,320,40)];
	sBar.delegate = self;
	[self.view addSubview:sBar];
	tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,41,320,400) style:UITableViewStyleGrouped];
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
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"TrailCell"] autorelease];
		cell.image = [UIImage imageNamed:@"bar-chart.png"];
		cell.text = [topList objectAtIndex:indexPath.row];
		ReportImageControl *imageControl = [[ReportImageControl alloc] initWithImageView:cell.imageView	tabBar:[self tabBarController]];

		imageControl.tag = indexPath.row;  // for reference in notifications.
		[cell.contentView addSubview: imageControl];
		
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

- (void)dealloc {
	[topList release];
    [super dealloc];
}


@end

