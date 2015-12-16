//
//  ExerciseDescriptionVC.h
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/18/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface ExerciseDescriptionVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) Exercise *myExercise;
@property (strong, nonatomic) NSString *eDescription;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end
