//
//  ViewController.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/12/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "MainViewController.h"
#import "MFSideMenu.h"
#import "SCInterface.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)awakeFromNib {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showSideMenu:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

@end
