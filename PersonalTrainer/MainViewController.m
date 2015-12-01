//
//  ViewController.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/12/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "MainViewController.h"
#import "SCInterface.h"
#import <AFNetworking/AFNetworking.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *parameters = @{
                                 @"program" : @{
                                         @"training_place" : @"1", //1 - Gym, 2 - Home
                                         @"training_type" : @"1" //1 - Strenght, 2 - Mass, 3 - Relief
                                         }
                                 };
    [manager POST:@"https://personal-trainer-app.herokuapp.com/programs" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
//    if([[self.feedDictionary allKeys] count] == 0) {
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        [manager GET:@"https://personal-trainer-app.herokuapp.com/programs" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"JSON: %@", responseObject);
//            self.feedDictionary = responseObject;
//            //            [self.myTableView reloadData];
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//        }];
//    } else {
//        
//    }
}


- (IBAction)showSideMenu:(id)sender {
    
}

@end
