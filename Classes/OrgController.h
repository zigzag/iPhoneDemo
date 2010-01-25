//
//  OrgController.h
//  cnpc
//
//  Created by zigzag on 1/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OrgController : UIViewController <UITableViewDelegate, UISearchBarDelegate, UITableViewDataSource>{
	NSArray *topList;
	UITableView *tableView;
	UISearchBar *sBar;
	NSInteger currentLevel;
}


@end
