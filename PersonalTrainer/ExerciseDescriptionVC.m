//
//  ExerciseDescriptionVC.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/18/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "ExerciseDescriptionVC.h"
#import <UIImageView+AFNetworking.h>

@implementation ExerciseDescriptionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.descriptionTextView setText:self.myExercise.eDescription];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.myExercise.eImageUrl];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
    [self.myImageView setImageWithURLRequest:request
                            placeholderImage:nil
                                     success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                         NSLog(@"%@", response);
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             [self.myImageView setImage:image];
                                         });
                                     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                         NSLog(@"%@", error);
                                     }];
    
    [self.descriptionTextView scrollsToTop];
    
}


@end
