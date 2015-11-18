//
//  ExerciseDetailTVC.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/16/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
#import "SCInterface.h"

@interface ExerciseDetailTVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Exercise *exercise;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (strong, nonatomic) NSMutableArray *exerciseArray;

@end
