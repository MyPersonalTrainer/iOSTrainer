//
//  ExcersiseTableVC.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/14/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "ExcersiseTableVC.h"
#import "ExerciseDetailTVC.h"
#import "MFSideMenu.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import "Constants.h"

@interface ExcersiseTableVC ()

@property (strong, nonatomic) NSMutableArray *imageUrlArray;
@property (strong, nonatomic) NSOrderedSet *imagesUrlSet;
@property (strong, nonatomic) NSMutableArray *imageArray;

@end

@implementation ExcersiseTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    self.imageArray = [NSMutableArray arrayWithObjects:
                       [UIImage imageNamed:@"Spyna"],
                       [UIImage imageNamed:@"Grudy"],
                       [UIImage imageNamed:@"Biceps"],
                       [UIImage imageNamed:@"Triceps"],
                       [UIImage imageNamed:@"Plechi"],
                       [UIImage imageNamed:@"Nohy"],
                       [UIImage imageNamed:@"Zhyvit"],
                       nil];
    
    //    NSLog(@"%@", [SCInterface unarchiveForKey:kExerciseResponseObject]);
    //    self.exerciseDictionary = [SCInterface unarchiveForKey:kExerciseResponseObject];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if([ud objectForKey:@"exerciseDictionary"] == nil) {
        if([[self.exerciseDictionary allKeys] count] == 0) {
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager GET:[NSString stringWithFormat:@"%@/exercises.json", BASE_URL] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"JSON: %@", responseObject);
                NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:responseObject];
                [ud setObject:dataSave forKey:@"exerciseDictionary"];
                [ud synchronize];
                self.exerciseDictionary = [responseObject valueForKey:@"muscle_group"];
                NSMutableArray *array = [[NSMutableArray alloc] init];
                for(NSDictionary *exercise in self.exerciseDictionary) {
                    Exercise *exer = [[Exercise alloc] initWithDictionary:exercise];
                    [array addObject:exer.eName];
                }
                self.exercisesSet = [[NSOrderedSet alloc] initWithArray:array];
                
                self.imageUrlArray = [[NSMutableArray alloc] init];
                self.imageUrlArray = [responseObject valueForKeyPath:@"muscle_group.image_url"];
                NSLog(@"%@", self.imageUrlArray);
                
                self.imagesUrlSet = [[NSOrderedSet alloc] initWithArray:self.imageUrlArray];
                
                [self.myTableView reloadData];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];
        } else {
            
        }
    }else {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"exerciseDictionary"];
        self.exerciseDictionary = [[NSKeyedUnarchiver unarchiveObjectWithData:data] valueForKey:@"muscle_group"];
        NSLog(@"JSON: %@", [ud objectForKey:@"exerciseDictionary"]);
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for(NSDictionary *exercise in self.exerciseDictionary) {
            Exercise *exer = [[Exercise alloc] initWithDictionary:exercise];
            [array addObject:exer.eName];
        }
        self.exercisesSet = [[NSOrderedSet alloc] initWithArray:array];
        
        [self.myTableView reloadData];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.exercisesSet ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exercisesSet ? self.exercisesSet.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.exercisesSet objectAtIndex:indexPath.row];
    cell.imageView.image = [self.imageArray objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ExerciseDetailTVC *edtvc = [segue destinationViewController];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"exerciseDictionary"];
    self.exerciseDictionary = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in self.exerciseDictionary) {
        if([[[dict valueForKey:@"muscle_group"] valueForKey:@"id"] isEqualToNumber:[NSNumber numberWithInteger:self.myTableView.indexPathForSelectedRow.row]]){
            [array addObject:dict];
        }
    }
    edtvc.exerciseArray = array;
    
}

@end
