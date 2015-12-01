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
#import "Exercise.h"
#import "Program.h"
#import "MainTableViewCell.h"
#import "Constants.h"
#import "ExerciseDetailTVC.h"

@interface MainViewController ()

@property (strong, nonatomic) NSMutableArray *programs;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSDictionary *parameters = @{
                                 @"program" : @{
                                         @"training_place" : @1, //1 - Gym, 2 - Home
                                         @"training_type" : @2 //1 - Strenght, 2 - Mass, 3 - Relief
                                         }
                                 };
    [manager POST:@"https://personal-trainer-app.herokuapp.com/programs" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"JSON: %@", responseObject);
        //        self.programs = [responseObject valueForKeyPath:@"training_days.exercises"];
        self.programs = [responseObject valueForKeyPath:@"training_days"];
        [self.myTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.programs ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.programs ? self.programs.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *dict = [self.programs objectAtIndex:indexPath.row];
    Program *program = [[Program alloc] initWithDictionary:[dict valueForKeyPath:@"exercises"]];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    cell.dayOfWeekLabel.text = program.dayOfWeek;
    cell.trainingType.text = [ud valueForKey:kUserTrainingType];
    cell.timeNeededLabel.text = program.timeNeeded;
    
    //    Exercise *exercise = [[Exercise alloc] initWithDictionary:self.programs[0][indexPath.row]];
    //    cell.textLabel.text = exercise.eName;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showProgramExercises"]) {
        ExerciseDetailTVC *edtvc = [segue destinationViewController];
        edtvc.exerciseArray = [[self.programs valueForKeyPath:@"exercises"] objectAtIndex:[self.myTableView indexPathForSelectedRow].row];
    }
}


@end
