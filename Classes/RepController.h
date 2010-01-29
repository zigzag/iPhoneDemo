//
//  RepController.h
//  cnpc
//
//  Created by zigzag on 1/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RepController : UIViewController {

	IBOutlet UINavigationController *naviController;
	IBOutlet UIWebView *webView;
	IBOutlet UIViewController *datePickController;
	IBOutlet UIDatePicker *datePicker;
	IBOutlet UISegmentedControl *chartSegment;
	IBOutlet UIView *contentView;
	
	
}

-(IBAction)tapSelectDate:(id)sender;
-(IBAction)tapToday:(id)sender;
-(IBAction)switchChart:(id)sender;
-(IBAction)bookMarkReport:(id)sender;

@end
