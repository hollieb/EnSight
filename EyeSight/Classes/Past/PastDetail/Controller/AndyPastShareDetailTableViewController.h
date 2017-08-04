//
//  AndyPastShareDetailTableViewController.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyCommonTableViewController.h"
#import "AndyPastDetailViewController.h"

@interface AndyPastShareDetailTableViewController : AndyCommonTableViewController

@property (nonatomic, weak) AndyPastDetailViewController *pastDetailViewController;

@property (nonatomic, copy) NSString *categoryShareDetailUrl;

@end
