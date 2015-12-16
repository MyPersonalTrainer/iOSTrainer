//
//  Exercise.m
//  PersonalTrainer
//
//  Created by Taras Pasichnyk on 11/12/15.
//  Copyright © 2015 Taras Pasichnyk. All rights reserved.
//

#import "Exercise.h"
#import "Constants.h"

@implementation Exercise

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self == nil) return nil;
    
    _eName = [dictionary valueForKey:@"name"];
//    _eMuscleGroup = [dictionary valueForKey:@"muscle_group"];
    NSArray *array = [[NSArray alloc] init];
    array = [dictionary valueForKeyPath:@"exercise_descriptions.step"];
    _eDescription = [array componentsJoinedByString:@"\n"];
    NSLog(@"DESCR: %@", _eDescription);
    
    _eImageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_URL, [dictionary objectForKey:@"ex_image_url"]]];
    
    return self;
}

@end
