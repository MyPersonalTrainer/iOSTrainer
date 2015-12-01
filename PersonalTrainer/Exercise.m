//
//  Exercise.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/12/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self == nil) return nil;
    
    _eName = [dictionary valueForKey:@"name"];
//    _eMuscleGroup = [dictionary valueForKey:@"muscle_group"];
    NSArray *array = [[NSArray alloc] init];
    array = [[dictionary objectForKey:@"exercise_descriptions"] valueForKey:@"step"];
    _eDescription = [array componentsJoinedByString:@"\n"];
    NSLog(@"DESCR: %@", _eDescription);
    return self;
}

@end
