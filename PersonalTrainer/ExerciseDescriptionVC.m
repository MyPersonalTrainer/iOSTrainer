//
//  ExerciseDescriptionVC.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/18/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "ExerciseDescriptionVC.h"

@implementation ExerciseDescriptionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.descriptionTextView setText:self.eDescription];
}


@end
