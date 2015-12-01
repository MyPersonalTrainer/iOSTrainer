//
//  ExerciseDetailTVC.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/16/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "ExerciseDetailTVC.h"
#import "MFSideMenu.h"
#import "Exercise.h"
#import "ExerciseDetailCell.h"
#import "ExerciseDescriptionVC.h"

@interface ExerciseDetailTVC ()

@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation ExerciseDetailTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items ? self.items.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExerciseDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Exercise *exercise = [self.items objectAtIndex:indexPath.row];
    
    cell.exerciseNameLabel.text = exercise.eName;
    
    return cell;
}

- (void)setExerciseArray:(NSMutableArray *)exerciseArray {
    _exerciseArray = exerciseArray;
    
    self.items = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in self.exerciseArray) {
        Exercise *exercise = [[Exercise alloc] initWithDictionary:dict];
        [self.items addObject:exercise];
    }
    
    [self.myTableView reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ExerciseDescriptionVC *edvc = [segue destinationViewController];
    Exercise *exercise = (Exercise *)[self.items objectAtIndex:[self.myTableView indexPathForSelectedRow].row];
    edvc.myExercise = exercise;
    edvc.eDescription = exercise.eDescription;
}

@end
