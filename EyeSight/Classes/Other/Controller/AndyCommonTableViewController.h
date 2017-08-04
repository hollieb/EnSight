//
//  AndyCommonTableViewController.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AndyCommonTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *videoList;

- (void)beginRefresh;

@end
