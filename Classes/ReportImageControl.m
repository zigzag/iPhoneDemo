//
//  ReportImageControl.m
//  cnpc
//
//  Created by zigzag on 1/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ReportImageControl.h"


@implementation ReportImageControl
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

- (id)initWithImageView:(UIImageView *)imageView tabBar:(UITabBarController *)tabBarController
{
	
	if ( self = [super initWithFrame: imageView.frame] ){
//		UIImageView *imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"bar-chart.png"]];
		topTabBarController = tabBarController;
		[self addSubview: imageView];
		[self addTarget: self action: @selector(toggleImage) forControlEvents: UIControlEventTouchUpInside];
//		[self addTarget: self action: @selector(toggleImage) forControlEvents: UIControlEventTouchDown];
	}
	
	return self;
}

- (void) toggleImage
{
	[topTabBarController setSelectedIndex:0];
}
@end
