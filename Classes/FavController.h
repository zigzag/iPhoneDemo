//
//  FavController.h
//  cnpc
//
//  Created by zigzag on 1/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FavController : UIViewController <UITableViewDataSource> {
	IBOutlet UINavigationController *naviController;
	IBOutlet UITableView *tableView;
}



@end
