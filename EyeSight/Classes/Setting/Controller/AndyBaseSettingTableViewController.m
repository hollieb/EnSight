//
//  AndyBaseSettingTableViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyBaseSettingTableViewController.h"
#import "AndySettingGroup.h"
#import "AndySettingCell.h"
#import "AndySettingItem.h"
#import "AndySettingArrowItem.h"
#import "AndySettingCacheArrowItem.h"
#import "AndySettingAlertArrowItem.h"
#import "MBProgressHUD+MJ.h"

@interface AndyBaseSettingTableViewController () <UIAlertViewDelegate>

@property(nonatomic, strong) AndySettingItem *settingSpecialItem;

@end

@implementation AndyBaseSettingTableViewController

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:style];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSMutableArray *)data
{
    if(_data == nil)
    {
        _data = [NSMutableArray array];
    }
    
    return _data;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AndySettingGroup *group = self.data[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AndySettingCell *cell = [AndySettingCell cellWithTableView:tableView];
    
    AndySettingGroup *group = self.data[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AndySettingGroup *group = self.data[indexPath.section];
    AndySettingItem *item = group.items[indexPath.row];
    
    if(item.option != nil)
    {
        if ([item isKindOfClass:[AndySettingCacheArrowItem class]])
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Are you sure you want to clean up the cache?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
            
            [alertView show];
            
            self.settingSpecialItem = item;
        }
        else
        {
            item.option();
        }
    }
    else if([item isKindOfClass:[AndySettingArrowItem class]])
    {
        AndySettingArrowItem *arrowItem = (AndySettingArrowItem *)item;
        if(arrowItem.destVcClass == nil)
        {
            return;
        }
        else
        {
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            vc.title = arrowItem.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        return;
    }
    else
    {
        if (self.settingSpecialItem.option != nil)
        {
            [MBProgressHUD showMessage:@"Cache cleanup..." toView:self.navigationController.view];
            self.settingSpecialItem.option();
        }
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    AndySettingGroup *group = self.data[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    AndySettingGroup *group = self.data[section];
    return group.footer;
}














@end
