//
//  ExerciseVIewControllerViewController.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/14/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "ExerciseVIewControllerViewController.h"
#import "MFSideMenu.h"
#import "SCInterface.h"

@interface ExerciseVIewControllerViewController ()

@property (strong, nonatomic) NSMutableArray *exerciseArray;

@end

@implementation ExerciseVIewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.exTableView.delegate = self;
    self.exTableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [SCInterface getJSONDataFromUrl];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:@"Cell"];
    }
    
//    cell.textLabel.text = [self.exerciseArray objectAtIndex:indexPath.row];
    cell.textLabel.text = @"";
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(void)setExerciseObject:(NSDictionary *)exerciseObject {
    if(_exerciseObject != exerciseObject) {
        _exerciseObject = exerciseObject;
    }
    
    self.exerciseArray = [NSMutableArray arrayWithArray:[_exerciseObject allKeys]];
    NSLog(@"%@", self.exerciseArray);
    [self.exTableView reloadData];
}

- (IBAction)callSideMenu:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
