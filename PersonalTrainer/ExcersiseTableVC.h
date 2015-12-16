//
//  ExcersiseTableVC.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/14/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface ExcersiseTableVC : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSDictionary *exerciseObject;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSDictionary *exerciseDictionary;
@property (strong, nonatomic) Exercise *exercise;
@property (strong, nonatomic) NSOrderedSet *exercisesSet;
@property (strong, nonatomic) NSOrderedSet *imagesSet;

@end
