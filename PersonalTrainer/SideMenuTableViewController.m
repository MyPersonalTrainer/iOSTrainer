//
//  SideMenuViewControllerTableViewController.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/12/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "SideMenuTableViewController.h"
#import "MFSideMenu.h"
#import "MainViewController.h"
#import "SCInterface.h"


@interface SideMenuTableViewController ()

@end

@implementation SideMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    [SCInterface getJSONDataFromUrl];
    
    self.avatarImageView.image = [UIImage imageNamed:@"avatar_image"];
    self.avatarImageView.layer.cornerRadius = 64.0;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.borderWidth = 3.0;
    self.avatarImageView.layer.borderColor = [UIColor yellowColor].CGColor;
    self.tableView.separatorColor = [UIColor yellowColor];
    self.nameLabel.text = @"TARAS PASICHNYK";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *controllerName;
    switch (indexPath.row) {
        case 1:
            controllerName = @"MainViewController";
            break;
        case 3:
            controllerName = @"ExcersiseTableVC";
            break;
        default:
            controllerName = nil;
            break;
    }
    
    if(controllerName != nil) {
        MainViewController *demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:controllerName];
    
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:demoViewController];
        navigationController.viewControllers = controllers;
    }
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
